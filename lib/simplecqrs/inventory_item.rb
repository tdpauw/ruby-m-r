module SimpleCQRS
  class InventoryItem
    def initialize(id, name)
      @changes = []
      apply(InventoryItemCreated.new(id, name))
    end

    def uncommittedChanges
      return @changes
    end

    def apply(e)
      @id = e.id
      @name = e.name
      @activated = true

      @changes.push(e)
    end
  end

  class InventoryItemCreated
    attr_reader :id
    attr_reader :name

    def initialize(id, name)
      @id = id
      @name = name
    end

    def ==(other)
      return @id == other.id && @name == other.name
    end

  end
end
