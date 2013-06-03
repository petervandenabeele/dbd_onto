module DbdOnto
  class Base < Dbd::Graph
    include ProvenanceMethods
    include FactMethods
  end
end
