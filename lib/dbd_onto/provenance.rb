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
      context_public = Dbd::ProvenanceFact.new(
        predicate: 'prov:context',
        object: 'public')
      @provenance << context_public
    end

    def resource
      return @resource if @resource
      @resource = Dbd::Resource.new(provenance_subject: provenance.subject)
      predicate_context = Dbd::Fact.new(
        predicate: 'meta:defines_predicate',
        object: 'prov:context')
      label_context = Dbd::Fact.new(
        predicate: RDF::RDFS.label.qname.join(':'),
        object: 'Context')
      @resource << predicate_context
      @resource << label_context
    end

  end
end
