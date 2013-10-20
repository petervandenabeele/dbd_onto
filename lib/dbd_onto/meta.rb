module DbdOnto
  class Meta < Base

    def initialize
      super
      self << meta_context
      self << meta_resource
    end

  private

    def meta_resource
      Dbd::Graph.new.from_CSV(meta_resource_csv)
    end

    def meta_resource_csv
<<EOS
"2013-09-03 21:41:36.627034414 UTC","1e84b23b-edf0-49f5-8ad3-76182dcfa124","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126c","meta:defines_predicate","meta:defines_predicate"
"2013-09-03 21:41:36.627066056 UTC","96d595be-205d-4c3a-8724-35b46457f9ed","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126c","rdfs:label","Defines predicate"
"2013-09-03 21:41:36.627067056 UTC","96d595be-205d-4c3a-8724-35b46457f9ee","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126c","rdf:uri","https://github.com/petervandenabeele/dbd_onto/blob/master/data/meta.md"
"2013-09-03 21:41:36.627068056 UTC","96d595be-205d-4c3a-8724-35b46457f9ef","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126c","rdfs:comment","Needed to bootstrap ontology definitions"
EOS
    end

  end
end
