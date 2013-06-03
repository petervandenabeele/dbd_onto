module DbdOnto
  module FactMethods

    def fact_label(attribute)
      # TODO in Dbd : turn predicate into a proper Predicate class
      Dbd::Fact.new(predicate: RDF::RDFS.label.qname.join(':'), object: attribute.gsub(/_/,' ').capitalize)
    end

  end
end
