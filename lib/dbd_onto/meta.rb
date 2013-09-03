module DbdOnto
  class Meta < Base

    META_ATTRIBUTES = %w(defines_predicate)

    def initialize
      super
      self << meta_context
      self << meta_resource
    end

  private

    def meta_resource
      graph = Dbd::Graph.new.from_CSV(meta_facts_csv)
      subject = graph.subjects.single
      meta_facts = graph.by_subject(subject)
      resource = resource_with_meta_context(subject: subject)
      add_meta_facts(resource, meta_facts)
      resource
    end

    def add_meta_facts(resource, meta_facts)
      # NOTE this can be cleaned-up when Dbd is Context << [] is fixed
      meta_facts.each do |meta_fact|
        resource << meta_fact
      end
    end

    def meta_facts_csv
<<EOS
"2013-09-03 21:41:36.627034414 UTC","1e84b23b-edf0-49f5-8ad3-76182dcfa124","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126c","meta:defines_predicate","meta:defines_predicate"
"2013-09-03 21:41:36.627066056 UTC","96d595be-205d-4c3a-8724-35b46457f9ed","36c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126c","rdfs:label","Defines predicate"
EOS
    end

  end
end
