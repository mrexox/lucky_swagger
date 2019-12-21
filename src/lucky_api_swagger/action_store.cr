module LuckyApiSwagger
  class ActionStore
    INSTANCE = self.new

    property store

    def initialize()
      @store = [] of ActionObject
    end

    def self.add(action : ActionObject)
      INSTANCE.store << action
    end
  end
end
