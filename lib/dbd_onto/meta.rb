module DbdOnto
  class Meta < Base

    def initialize
      super
      self << meta_context
      self << meta_resource
    end

  private

    def meta_resource
      ::Dbd::Graph.new.from_CSV(meta_resource_csv)
    end

    def meta_resource_csv
<<EOS
"2013-09-03 21:41:36.627034414 UTC","1e84b23b-edf0-49f5-8ad3-76182dcfa124","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126c","meta:defines_predicate","s","meta:defines_predicate"
"2013-09-03 21:41:36.627066056 UTC","96d595be-205d-4c3a-8724-35b46457f9ed","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126c","rdfs:label","s","Defines predicate"
"2013-09-03 21:41:36.627067056 UTC","96d595be-205d-4c3a-8724-35b46457f9ee","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126c","dbd:rdf_uri","s","https://github.com/petervandenabeele/dbd_onto/blob/master/data/meta.md"
"2013-09-03 21:41:36.627068056 UTC","96d595be-205d-4c3a-8724-35b46457f9ef","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126c","rdfs:comment","s","Needed to bootstrap ontology definitions"
"2013-09-03 21:41:36.627069056 UTC","1e84b23b-edf0-49f5-8ad3-76182dcfa125","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126d","meta:defines_predicate","s","meta:predicate_used"
"2013-09-03 21:41:36.627070056 UTC","96d595be-205d-4c3a-8724-35b46457f9f0","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126d","rdfs:label","s","Predicate used"
"2013-09-03 21:41:36.627071056 UTC","96d595be-205d-4c3a-8724-35b46457f9f1","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126d","dbd:rdf_uri","s","https://github.com/petervandenabeele/dbd_onto/blob/master/data/meta.md"
"2013-09-03 21:41:36.627072056 UTC","96d595be-205d-4c3a-8724-35b46457f9f2","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126d","rdfs:comment","s","Is this predicate used in the UI for creating new resources?"
"2014-04-24 06:41:36.000001000 UTC","96d595be-205d-4c3a-8724-35b46457f9f3","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126c","meta:predicate_used","s","true"
"2014-04-24 06:41:36.000002000 UTC","96d595be-205d-4c3a-8724-35b46457f9f4","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126d","meta:predicate_used","s","true"
EOS
    end

  end
end
