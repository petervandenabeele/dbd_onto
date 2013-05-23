module DbdOnto
  class Provenance < Base

    def initialize
      super
      self << provenance
      self << resource
    end

  private

    def provenance
      @provenance ||= Dbd::ProvenanceResource.new
    end

    def resource
      @resource ||= Dbd::Resource.new(provenance_subject: provenance.subject)
      context_predicate = Dbd::Fact.new(
        predicate: 'rdf:predicate',
        object: 'prov:context')
      context_label = Dbd::Fact.new(
        predicate: RDF::RDFS.label.qname.join(':'),
        object: 'Context')
      @resource << context_predicate
      @resource << context_label
    end

  end
end
