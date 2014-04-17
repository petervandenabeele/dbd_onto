module DbdOnto
  class Rdf < Base

    def initialize
      super
      self << rdf_context
      self << rdf_resource
    end

  private

    def rdf_resource
      ::Dbd::Graph.new.from_CSV(rdf_resource_csv)
    end

    def rdf_resource_csv
<<EOS
"2014-04-17 19:30:36.627034414 UTC","74eae2a4-06c6-41c1-94b9-298905dcbd00","38c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126c","meta:defines_predicate","s","rdf:type"
"2014-04-17 19:30:36.627066056 UTC","74eae2a4-06c6-41c1-94b9-298905dcbd01","38c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126c","rdfs:label","s","RDF type"
"2014-04-17 19:30:36.627067056 UTC","74eae2a4-06c6-41c1-94b9-298905dcbd02","38c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126c","dbd:rdf_uri","s","http://www.w3.org/TR/rdf-schema/#ch_type"
"2014-04-17 19:30:36.627068056 UTC","74eae2a4-06c6-41c1-94b9-298905dcbd03","38c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126c","rdfs:comment","s","Is used to state that a resource is an instance of a class."
"2014-04-17 19:30:36.627069056 UTC","74eae2a4-06c6-41c1-94b9-298905dcbd04","38c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126c","meta:predicate_used","s","true"
EOS
    end

  end
end
