module DbdOnto
  class Schema < Base

    def initialize
      super
      self << schema_context
      self << schema_resource
    end

  private

    def schema_resource
      Dbd::Graph.new.from_CSV(schema_resource_csv)
    end

    def schema_resource_csv
<<EOS
"2013-10-14 21:55:36.627034414 UTC","1f84b23b-edf0-49f5-8ad3-76182dcfa124","37c0b50f-834e-45f5-a911-e3f2b47fe4b9","619e69d4-6dad-4b14-bfce-8fd67d8e126c","meta:defines_predicate","schema:about"
EOS
    end

  end
end
