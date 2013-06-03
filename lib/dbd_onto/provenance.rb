module DbdOnto
  class Provenance < Base

    PROV_ATTRIBUTES = %w(context source license)
    DCTERMS_ATTRIBUTES = %w(creator created)

    def initialize
      super
      self << provenance
      self << prov_resources
      self << dcterms_resources
    end

  private

    def provenance_attributes
      [
       #[predicate, object]
        ['prov:context', 'public'],
        ['prov:source' , 'https://github.com/petervandenabeele/dbd/blob/d37360070e7f8e61a19c2bca210c881a151ded75/docs/rationale.md'],
        ['dcterms:creator' , 'Peter Vandenabeele (@peter_v)'],
        ['dcterms:created', Time.new(2013,5,26,23,30,0,'+02:00').utc],
        ['prov:license', 'Copyright 2013 Peter Vandenabeele (http://vandenabeele.com), licensed under MIT license.']
      ]
    end

    def prov_resources
      PROV_ATTRIBUTES.map do |attribute|
        resource = Dbd::Resource.new(provenance_subject: provenance.subject)
        resource << fact_defines_predicate_prov(attribute)
        resource << fact_label(attribute)
      end
    end

    # NOTE using dcterms:creator is not exact for now as the range
    #      should be a dcterms:Agent and it is a Literal here.
    def dcterms_resources
      DCTERMS_ATTRIBUTES.map do |attribute|
        resource = Dbd::Resource.new(provenance_subject: provenance.subject)
        resource << fact_defines_predicate_dcterms(attribute)
        resource << fact_label(attribute)
      end
    end

    def fact_defines_predicate_prov(attribute)
      Dbd::Fact.new(predicate: 'meta:defines_predicate', object: "prov:#{attribute}")
    end

    def fact_defines_predicate_dcterms(attribute)
      Dbd::Fact.new(predicate: 'meta:defines_predicate', object: "dcterms:#{attribute}")
    end

  end
end
