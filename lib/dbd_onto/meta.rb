module DbdOnto
  class Meta < Base

    META_ATTRIBUTES = %w(defines_predicate)

    def initialize
      super
      self << meta_provenance
      self << meta_resources
    end

  private

    def meta_resources
      META_ATTRIBUTES.map do |attribute|
        resource = resource_with_meta_provenance
        resource << fact_defines_predicate_meta(attribute)
        resource << fact_label(attribute)
      end
    end

    def fact_defines_predicate_meta(attribute)
      Dbd::Fact.new(predicate: 'meta:defines_predicate', object: "meta:#{attribute}")
    end

  end
end
