require 'dbd'

module DbdOnto
  class Schema < Base

    def initialize
      super
      self << schema_context
      self << self.class.schema
      self << self.class.used_predicates
      self.freeze
    end

  private

    def self.schema_filename
      File.expand_path('../../../data/schema_data.csv', __FILE__)
    end

    def self.used_predicates_filename
      File.expand_path('../../../data/used_predicates_data.csv', __FILE__)
    end

    # performance optimization (a bit ugly, but it works ...)
    # use a class instance variable to cache the schema
    # at _load_ time! Also tried "memoization" increases reported
    # RSpec test time from 0.20 to 0.67 seconds (which could be
    # relevant, since we really want to minimize the _run-time_
    # cost after loading the Ruby/Rails app (e.g. in Passenger))

    @schema = Dbd::Graph.new.from_CSV(File.open(schema_filename))
    @used_predicates = Dbd::Graph.new.from_CSV(File.open(used_predicates_filename))

    def self.schema
      @schema
    end

    def self.used_predicates
      @used_predicates
    end

    # This code is reused on 2013-10-15 with permission from the ruby-rdf/rdf project
    # from the file https://github.com/ruby-rdf/rdf/blob/master/lib/rdf/vocab/schema.rb
    # It was licensed as "public domain" (https://github.com/ruby-rdf/rdf/blob/master/UNLICENSE)
    def self.generate_schema
      require 'addressable/uri'
      require 'rdf/rdfa'
      v = RDF::Graph.load("http://schema.org/docs/schema_org_rdfa.html", format: :rdfa)

      schema_hash = {}

      # NOTE: it is unclear if this now generates rdf:uri or dbd:rdf_uri as predicates
      # build the list of schema:predicates
      v.query(property: RDF.type, object: RDF.Property) do |c|
        uri = c.subject.to_s
        schema_predicate = "schema:#{uri.split('/').last}"
        schema_hash[schema_predicate] = {
            'meta:defines_predicate' => schema_predicate,
            'rdf:uri' => uri}
      end

      # fill the required properties from the RDF::Graph
      schema_hash.each do |schema_predicate, properties_hash|
        v.query(subject: RDF::URI(properties_hash['rdf:uri'])) do |c|
          case c.predicate
            when RDF::RDFS.label
              properties_hash['rdfs:label'] = c.object.to_s
            when RDF::RDFS.comment
              properties_hash['rdfs:comment'] = c.object.to_s
          end
        end
      end

      # create a graoh with 1 resource per schema:<predicate>
      # we now save the schema:<predicate>, rdf:uri, rdfs:label and rdfs:comment
      schema = Base.new
      schema_context = schema.schema_context

      schema_hash.each do |schema_predicate, properties_hash|
        resource = Dbd::Resource.new(context_subject: schema_context.subject)
        properties_hash.each do |predicate, object|
          resource << ::Dbd::Fact.new(
            predicate: predicate,
            object_type: 's', # should 'u' for the uri
            object: object)
        end
        schema << resource
      end

      schema.to_CSV
    end

    def self.used_predicates_list_filename
      File.expand_path('../../../data/used_schema_predicates_list.csv', __FILE__)
    end

    def self.generate_used_predicates_data
      # Build the list of used_predicates
      used_predicates = [].tap do |_used_predicates|
        File.open(used_predicates_list_filename) do |file|
          file.readlines.each do |line|
            subject, _ = line.split(/,/)
            subject.gsub!(/"/, '')
            _used_predicates << subject
          end
        end
      end

      # create a graoh with 1 fact per entry
      used_predicates_graph = Base.new
      schema_context = used_predicates_graph.schema_context

      used_predicates.each do |used_subject|
        fact = ::Dbd::Fact.new(
          context_subject: schema_context.subject,
          subject: used_subject,
          predicate: "meta:predicate_used",
          object_type: 's', # upgrade to boolean
          object: 'true'
        )
        used_predicates_graph  << fact
      end

      csv_data = used_predicates_graph.to_CSV
      filename = '/Users/peter_v/Documents/data/github/petervandenabeele/dbd_onto/data/used_predicates_data.csv'
      File.open(filename, 'w') do |file|
        file << csv_data
      end
      csv_data
    end
  end
end
