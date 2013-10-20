module DbdOnto
  class Context < Base

    def initialize
      super
      self << meta_context
      self << context_definition
    end

  private

    def context_definition
      Dbd::Graph.new.from_CSV(context_definition_csv)
    end

    def context_definition_csv
<<EOS
"2013-09-04 20:06:29.398680722 UTC","49a95413-64b6-4f86-ad44-caa7b03931f6","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","03e72b0c-041f-4afd-aab4-520db49b1fb1","meta:defines_predicate","context:visibility"
"2013-09-04 20:06:29.398711938 UTC","1614f36e-5b64-43ef-9228-ef391dc2902a","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","03e72b0c-041f-4afd-aab4-520db49b1fb1","rdfs:label","Visibility"
"2013-09-04 20:06:29.398712938 UTC","1614f36e-5b64-43ef-9228-ef391dc2902b","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","03e72b0c-041f-4afd-aab4-520db49b1fb1","rdf:uri","https://github.com/petervandenabeele/dbd_onto/blob/master/context.md"
"2013-09-04 20:06:29.398713938 UTC","1614f36e-5b64-43ef-9228-ef391dc2902c","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","03e72b0c-041f-4afd-aab4-520db49b1fb1","rdfs:comment","E.g. public, private, professional, ..."
"2013-09-04 20:06:29.398728011 UTC","886738b0-fcf8-455e-a5a1-3f192b3cbbc1","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","735ae2a2-ed1f-405a-808a-07117cd6888c","meta:defines_predicate","context:encryption"
"2013-09-04 20:06:29.398743950 UTC","b85ea90d-01ea-4fc6-81b1-24cdabe9a968","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","735ae2a2-ed1f-405a-808a-07117cd6888c","rdfs:label","Encryption"
"2013-09-04 20:06:29.398744950 UTC","b85ea90d-01ea-4fc6-81b1-24cdabe9a969","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","735ae2a2-ed1f-405a-808a-07117cd6888c","rdf:uri","https://github.com/petervandenabeele/dbd_onto/blob/master/context.md"
"2013-09-04 20:06:29.398745950 UTC","b85ea90d-01ea-4fc6-81b1-24cdabe9a96a","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","735ae2a2-ed1f-405a-808a-07117cd6888c","rdfs:comment","E.g. clear, encrypted, AES-256, my_very_secret_key"
"2013-09-04 20:06:29.398758526 UTC","6d9b18f7-ed98-488e-8d67-bd830c51efbd","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","5b2c73e5-490c-47e0-a014-592d8665ba58","meta:defines_predicate","context:license"
"2013-09-04 20:06:29.398775364 UTC","cd7d3d4a-d9c4-46e5-ba12-bc41938e50d4","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","5b2c73e5-490c-47e0-a014-592d8665ba58","rdfs:label","License"
"2013-09-04 20:06:29.398776364 UTC","cd7d3d4a-d9c4-46e5-ba12-bc41938e50d5","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","5b2c73e5-490c-47e0-a014-592d8665ba58","rdf:uri","https://github.com/petervandenabeele/dbd_onto/blob/master/context.md"
"2013-09-04 20:06:29.398777364 UTC","cd7d3d4a-d9c4-46e5-ba12-bc41938e50d6","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","5b2c73e5-490c-47e0-a014-592d8665ba58","rdfs:comment","E.g. Copyright 2013 Peter Vandenabeele (http://vandenabeele.com), licensed under MIT"
"2013-09-04 20:06:29.411179884 UTC","a95a1e01-5701-41fa-ae57-5a93fc4e530e","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","ffc41d9c-ba51-4121-ae01-c2b04234b5f0","meta:defines_predicate","dc:source"
"2013-09-04 20:06:29.411232005 UTC","f063bd74-f767-47ed-a561-842eba382b79","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","ffc41d9c-ba51-4121-ae01-c2b04234b5f0","rdfs:label","Source"
"2013-09-04 20:06:29.411233005 UTC","f063bd74-f767-47ed-a561-842eba382b7a","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","ffc41d9c-ba51-4121-ae01-c2b04234b5f0","rdf:uri","https://github.com/petervandenabeele/dbd_onto/blob/master/context.md"
"2013-09-04 20:06:29.411234005 UTC","f063bd74-f767-47ed-a561-842eba382b7b","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","ffc41d9c-ba51-4121-ae01-c2b04234b5f0","rdfs:comment","E.g. Entered manually by @peter_v (also see Dublin Core)"
"2013-09-04 20:06:29.411249613 UTC","8ebc54af-bfd9-47ad-8e19-c04282720743","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","2b5008b0-e12d-4aa2-8bb1-f9c20c36f8ef","meta:defines_predicate","dc:creator"
"2013-09-04 20:06:29.411264605 UTC","6d726d47-31cb-43a9-9e6d-b44401149500","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","2b5008b0-e12d-4aa2-8bb1-f9c20c36f8ef","rdfs:label","Creator"
"2013-09-04 20:06:29.411265605 UTC","6d726d47-31cb-43a9-9e6d-b44401149501","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","2b5008b0-e12d-4aa2-8bb1-f9c20c36f8ef","rdf:uri","https://github.com/petervandenabeele/dbd_onto/blob/master/context.md"
"2013-09-04 20:06:29.411266605 UTC","6d726d47-31cb-43a9-9e6d-b44401149502","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","2b5008b0-e12d-4aa2-8bb1-f9c20c36f8ef","rdfs:comment","E.g. @peter_v (also see Dublin Core)"
"2013-09-04 20:06:29.414653441 UTC","90b35dd7-baa3-49b7-a224-d67d3ccadb7a","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","4aba46de-f35a-4754-913d-bdc4c926fc73","meta:defines_predicate","dcterms:created"
"2013-09-04 20:06:29.414677275 UTC","1ed030cf-260d-4380-bbbf-84f7c7e9d753","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","4aba46de-f35a-4754-913d-bdc4c926fc73","rdfs:label","Created"
"2013-09-04 20:06:29.414678275 UTC","1ed030cf-260d-4380-bbbf-84f7c7e9d753","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","4aba46de-f35a-4754-913d-bdc4c926fc73","rdf:uri","https://github.com/petervandenabeele/dbd_onto/blob/master/context.md"
"2013-09-04 20:06:29.414679275 UTC","1ed030cf-260d-4380-bbbf-84f7c7e9d753","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","4aba46de-f35a-4754-913d-bdc4c926fc73","rdfs:comment","E.g. 2013-10-20 (also see Dublin Core Terms)"
EOS
    end
  end
end
