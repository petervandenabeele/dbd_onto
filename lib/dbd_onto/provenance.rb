module DbdOnto
  class Provenance < Base

    # NOTE This complete implementation probably needs to be
    #      adapted to use the recent W3C Provenance work:
    #      http://www.w3.org/TR/2013/NOTE-prov-overview-20130430/
    PROV_ATTRIBUTES = %w(context encryption source license)
    DCTERMS_ATTRIBUTES = %w(creator created)

    def initialize
      super
      self << meta_provenance
      self << prov_resources
      self << dcterms_resources
    end

  private

    def prov_resources
      PROV_ATTRIBUTES.map do |attribute|
        resource = resource_with_meta_provenance
        resource << fact_defines_predicate_prov(attribute)
        resource << fact_label(attribute)
      end
    end

    # NOTE using dcterms:creator is not exact for now as the range
    #      should be a dcterms:Agent and it is a Literal here.
    def dcterms_resources
      DCTERMS_ATTRIBUTES.map do |attribute|
        resource = resource_with_meta_provenance
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
