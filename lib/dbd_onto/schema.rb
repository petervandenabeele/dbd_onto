module DbdOnto
  class Schema < Base

    def initialize
      super
      self << schema_context
      self << self.class.schema_resource
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
    # use a class instance variable to cache the schema_resource
    # at _load_ time! Also tried "memoization" increases reported
    # RSpec test time from 0.20 to 0.67 seconds (which could be
    # relevant, since we really want to minimize the _run-time_
    # cost after loading the Ruby/Rails app (e.g. in Passenger))

    @schema_resource = Dbd::Graph.new.from_CSV(File.open(schema_filename))
    @used_predicates = Dbd::Graph.new.from_CSV(File.open(used_predicates_filename))

    def self.schema_resource
      @schema_resource
    end

    def self.used_predicates
      @used_predicates
    end

    # This code is reused on 2013-10-15 with permission from the ruby-rdf/rdf project
    # from the file https://github.com/ruby-rdf/rdf/blob/master/lib/rdf/vocab/schema.rb
    # It was licensed as "public domain" (https://github.com/ruby-rdf/rdf/blob/master/UNLICENSE)
    def self.generate_schema_data
      require 'addressable/uri'
      require 'rdf/rdfa'
      v = RDF::Graph.load("http://schema.org/docs/schema_org_rdfa.html", format: :rdfa)

      schema_hash = {}

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
      schema_resource = Base.new
      schema_context = schema_resource.schema_context

      schema_hash.each do |schema_predicate, properties_hash|
        resource = Dbd::Resource.new(context_subject: schema_context.subject)
        properties_hash.each do |predicate, object|
          resource << Dbd::Fact.new(
            predicate: predicate,
            object_type: 's', # should 'u' for the uri
            object: object)
        end
        schema_resource << resource
      end

      schema_resource.to_CSV
    end
  end
end
