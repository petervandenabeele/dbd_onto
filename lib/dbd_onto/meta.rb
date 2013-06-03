module DbdOnto
  class Meta < Base

    META_ATTRIBUTES = %w(defines_predicate)

    def initialize
      super
      self << provenance
      self << meta_resources
    end

  private

    def provenance_attributes
      [
       #[predicate, object]
        ['prov:context', 'public'],
        ['prov:source' , 'https://github.com/petervandenabeele/dbd_onto/blob/08adb5bf0ed5cd259ad4d31d9d8ebbbe230c66b1/lib/dbd_onto/provenance.rb'],
        ['dcterms:creator' , 'Peter Vandenabeele (@peter_v)'],
        ['dcterms:created', Time.new(2013,6,3,21,0,0).utc],
        ['prov:license', 'Copyright 2013 Peter Vandenabeele (http://vandenabeele.com), licensed under MIT license.']
      ]
    end

    def meta_resources
      META_ATTRIBUTES.map do |attribute|
        resource = Dbd::Resource.new(provenance_subject: provenance.subject)
        resource << fact_defines_predicate_meta(attribute)
        resource << fact_label(attribute)
      end
    end

    def fact_defines_predicate_meta(attribute)
      Dbd::Fact.new(predicate: 'meta:defines_predicate', object: "meta:#{attribute}")
    end

  end
end
