module DbdOnto
  module ProvenanceMethods

    def provenance
      # memoize to avoid making new_provenance on each call
      @provenance ||= new_provenance
    end

    def new_provenance
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

  end
end
