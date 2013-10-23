module DbdOnto
  class Dbd < Base

    def initialize
      super
      self << meta_context
      self << dbd_resource
    end

  private

    def dbd_resource
      ::Dbd::Graph.new.from_CSV(dbd_resource_csv)
    end

    def dbd_resource_csv
<<EOS
"2013-10-23 19:41:36.627034414 UTC","1e84b23b-edf0-49f5-8ad3-76182dcfa134","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e127c","meta:defines_predicate","s","dbd:rdf_uri"
"2013-10-23 19:41:36.627066056 UTC","96d595be-205d-4c3a-8724-35b46457f9fd","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e127c","rdfs:label","s","RDF URI"
"2013-10-23 19:41:36.627067056 UTC","96d595be-205d-4c3a-8724-35b46457f9fe","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e127c","dbd:rdf_uri","s","https://github.com/petervandenabeele/dbd_onto/blob/master/data/dbd.md"
"2013-10-23 19:41:36.627068056 UTC","96d595be-205d-4c3a-8724-35b46457f9ff","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e127c","rdfs:comment","s","points to an RDF URI type, without the <> characters"
EOS
    end

  end
end
