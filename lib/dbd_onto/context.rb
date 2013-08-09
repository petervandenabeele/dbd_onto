module DbdOnto
  class Context < Base

    CONTEXT_ATTRIBUTES = %w(visibility encryption license)
    DC_ATTRIBUTES = %w(source creator)
    DCTERMS_ATTRIBUTES = %w(created)

    def initialize
      super
      self << meta_context
      self << context_resources
      self << dc_resources
      self << dcterms_resources
    end

  private

    def context_resources
      CONTEXT_ATTRIBUTES.map do |attribute|
        resource = resource_with_meta_context
        resource << fact_defines_predicate(:context, attribute)
        resource << fact_label(attribute)
      end
    end

    def dc_resources
      DC_ATTRIBUTES.map do |attribute|
        resource = resource_with_meta_context
        resource << fact_defines_predicate(:dc, attribute)
        resource << fact_label(attribute)
      end
    end

    def dcterms_resources
      DCTERMS_ATTRIBUTES.map do |attribute|
        resource = resource_with_meta_context
        resource << fact_defines_predicate(:dcterms, attribute)
        resource << fact_label(attribute)
      end
    end

    def fact_defines_predicate(prefix, attribute)
      Dbd::Fact.new(predicate: 'meta:defines_predicate', object: "#{prefix}:#{attribute}")
    end

  end
end
