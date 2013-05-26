module DbdOnto
  class Provenance < Base

    PROV_ATTRIBUTES = %w(context source license)
    DCTERMS_ATTRIBUTES = %w(creator created)

    def initialize
      super
      self << provenance
      add_prov_attributes
      add_dcterms_attributes
    end

  private

    def provenance
      # memoize to avoid making new_provenance on each call
      @provenance ||= new_provenance
    end

    PROVENANCE = [
      ['prov:context', 'public'],
      ['prov:source' , 'https://github.com/petervandenabeele/dbd/blob/d37360070e7f8e61a19c2bca210c881a151ded75/docs/rationale.md'],
      ['dcterms:creator' , 'Peter Vandenabeele (@peter_v)'],
      ['dcterms:created', Time.new(2013,5,26,21,30,0).utc],
      ['prov:license', 'Copyright 2013 Peter Vandenabeele (http://vandenabeele.com), licensed under MIT license.']
    ]

    def new_provenance
      Dbd::ProvenanceResource.new.tap do |_provenance|
        PROVENANCE.each do |provenance_fact_data|
          _provenance << provenance_fact(provenance_fact_data)
        end
      end
    end

    def provenance_fact(provenance_fact_data)
      Dbd::ProvenanceFact.new(
        predicate: provenance_fact_data.first,
        object: provenance_fact_data.last)
    end

    def add_prov_attributes
      PROV_ATTRIBUTES.each do |attribute|
        resource = Dbd::Resource.new(provenance_subject: provenance.subject)
        resource << fact_defines_predicate_prov(attribute)
        resource << fact_label(attribute)
        self << resource
      end
    end

    # NOTE using dcterms:creator is not exact for now as the range
    #      should be a dcterms:Agent and it is a Literal here.
    def add_dcterms_attributes
      DCTERMS_ATTRIBUTES.each do |attribute|
        resource = Dbd::Resource.new(provenance_subject: provenance.subject)
        resource << fact_defines_predicate_dcterms(attribute)
        resource << fact_label(attribute)
        self << resource
      end
    end

    def fact_defines_predicate_prov(attribute)
      Dbd::Fact.new(predicate: 'meta:defines_predicate', object: "prov:#{attribute}")
    end

    def fact_defines_predicate_dcterms(attribute)
      Dbd::Fact.new(predicate: 'meta:defines_predicate', object: "dcterms:#{attribute}")
    end

    def fact_label(attribute)
      # TODO in Dbd : turn predicate into a proper Predicate class
      Dbd::Fact.new(predicate: RDF::RDFS.label.qname.join(':'), object: attribute.capitalize)
    end

  end
end
