module DbdOnto
  class Schema < Base

    def initialize
      super
      self << schema_context
      self << schema_resource
    end

  private

    def schema_resource
      # FIXME this takes about 0.47 seconds on each load
      # FIXME (expected performance ... 2500 facts at 200 us)
      # FIXME that will be unworkable for tests and production
      Dbd::Graph.new.from_CSV(File.open(filename))
    end

    def filename
      File.expand_path('../schema_data.csv', __FILE__)
    end

    # This code is reused on 2013-10-15 with permission from the ruby-rdf/rdf project
    # from the file https://github.com/ruby-rdf/rdf/blob/master/lib/rdf/vocab/schema.rb
    # It was licensed as "public domain" (https://github.com/ruby-rdf/rdf/blob/master/UNLICENSE)
    def self.generate
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
            object: object)
        end
        schema_resource << resource
      end

      schema_resource.to_CSV
    end
  end
end
