module DbdOnto
  class Schema < Base

    def initialize
      super
      self << schema_context
      self << schema_resource
    end

  private

    def schema_resource
      Dbd::Graph.new.from_CSV(schema_resource_csv)
    end

    def schema_resource_csv
      self.class.generate
#<<EOS
#"2013-10-14 21:55:36.627034414 UTC","1f84b23b-edf0-49f5-8ad3-76182dcfa124","37c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126c","meta:defines_predicate","schema:about"
#EOS
    end

    # This code is reused on 2013-10-15 with permission from the ruby-rdf/rdf project
    # from the file https://github.com/ruby-rdf/rdf/blob/master/lib/rdf/vocab/schema.rb
    # It was licensed as "public domain" (https://github.com/ruby-rdf/rdf/blob/master/UNLICENSE)
    #
    # NOTE: It has 2 dependencies. But, rdf-rdfa relies on nokogiri, which since 1.6 takes
    # a very long time to build, so commenting that out in the gemspec by default.
    def self.generate
      require 'addressable/uri'
      require 'rdf/rdfa'
      v = RDF::Graph.load("http://schema.org/docs/schema_org_rdfa.html", format: :rdfa)

      schema_hash = {}

      # build the list of schema:predicates
      v.query(property: RDF.type, object: RDF.Property) do |c|
        uri = c.subject.to_s
        schema_predicate = "schema:#{uri.split('/').last}"
        schema_hash[schema_predicate] = {'rdf:uri' => uri}
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

      schema_resource = Base.new
      schema_context = schema_resource.schema_context

      schema_hash.each do |schema_predicate, properties_hash|
        resource = Dbd::Resource.new(context_subject: schema_context.subject)
        meta_defines_predicate = Dbd::Fact.new(
          predicate: 'meta:defines_predicate',
          object: schema_predicate)
        resource << meta_defines_predicate

        properties_hash.each do |predicate, object|
          schema_fact = Dbd::Fact.new(
              predicate: predicate,
              object: object)
          resource << schema_fact
        end
        schema_resource << resource
      end

      schema_resource.to_CSV
    end
  end
end

