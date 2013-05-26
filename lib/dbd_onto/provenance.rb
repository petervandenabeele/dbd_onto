module DbdOnto
  class Provenance < Base

    def initialize
      super
      self << provenance
      self << resource
    end

  private

    def provenance
      return @provenance if @provenance
      @provenance = Dbd::ProvenanceResource.new
      @provenance << provenance_fact_context_public
    end

    def resource
      return @resource if @resource
      @resource = Dbd::Resource.new(provenance_subject: provenance.subject)
      @resource << fact_defines_predicate_prov_context
      @resource << fact_label_context
    end

    def provenance_fact_context_public
      Dbd::ProvenanceFact.new(predicate: 'prov:context', object: 'public')
    end

    def fact_defines_predicate_prov_context
      Dbd::Fact.new(predicate: 'meta:defines_predicate', object: 'prov:context')
    end

    def fact_label_context
      # TODO in Dbd : turn predicate into a proper Predicate class
      Dbd::Fact.new(predicate: RDF::RDFS.label.qname.join(':'), object: 'Context')
    end

  end
end
