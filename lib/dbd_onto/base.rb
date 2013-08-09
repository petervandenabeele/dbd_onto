module DbdOnto
  class Base < Dbd::Graph
    include MetaContext
    include FactMethods
  end
end
