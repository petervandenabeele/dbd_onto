module DbdOnto
  module MetaProvenance

    def resource_with_meta_provenance
        Dbd::Resource.new(provenance_subject: meta_provenance.subject)
    end

    def meta_provenance
      # memoize to avoid making new_provenance on each call
      @provenance_resource ||= new_provenance_resource
    end

  private

    def new_provenance_resource
      Dbd::ProvenanceResource.new.tap do |_provenance|
        provenance_attributes.each do |provenance_fact_data|
          _provenance << provenance_fact(provenance_fact_data)
        end
      end
    end

    def provenance_fact(provenance_fact_data)
      Dbd::ProvenanceFact.new(
        predicate: provenance_fact_data.first,
        object: provenance_fact_data.last)
    end

    def provenance_attributes
      [
       #[predicate, object]
        ['prov:context', 'public'],
        ['prov:encryption', 'clear'],
        ['prov:source' , 'https://github.com/petervandenabeele/dbd/blob/d37360070e7f8e61a19c2bca210c881a151ded75/docs/rationale.md'],
        ['dcterms:creator' , 'Peter Vandenabeele (@peter_v)'],
        ['dcterms:created', Time.new(2013,5,26,23,30,0,'+02:00').utc],
        ['prov:license', 'Copyright 2013 Peter Vandenabeele (http://vandenabeele.com), licensed under MIT license.']
      ]
    end

  end
end
