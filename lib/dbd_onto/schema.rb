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
#<<EOS
#"2013-10-15 22:07:13.538320274 UTC","288aaa82-914a-4605-a4a2-0087c64baedb","37c0b50f-834e-45f5-a911-e3f2b47fe4b9","e85ca573-8cf8-4108-9bea-7686d68f5b82","meta:defines_predicate","schema:about"
#"2013-10-15 22:07:13.538354436 UTC","391bcb37-6075-4d74-9373-4b156c4a047e","37c0b50f-834e-45f5-a911-e3f2b47fe4b9","e85ca573-8cf8-4108-9bea-7686d68f5b82","rdf:uri","http://schema.org/about"
#"2013-10-15 22:07:13.538370320 UTC","0a638e09-59f1-4a3f-a4c5-b50237fb249e","37c0b50f-834e-45f5-a911-e3f2b47fe4b9","e85ca573-8cf8-4108-9bea-7686d68f5b82","rdfs:label","about"
#"2013-10-15 22:07:13.538385796 UTC","631c8d7a-a75e-4681-99d9-4c658c38398b","37c0b50f-834e-45f5-a911-e3f2b47fe4b9","e85ca573-8cf8-4108-9bea-7686d68f5b82","rdfs:comment","The subject matter of the content."
#... many more predicates
#EOS

      # temporary , will be replaced by a static CSV string
      self.class.generate
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

