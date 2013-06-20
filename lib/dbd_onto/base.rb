module DbdOnto
  class Base < Dbd::Graph
    include MetaProvenance
    include FactMethods
  end
end
