require "./action_object"

module LuckyApiSwagger
  class ActionStore
    INSTANCE = new

    getter store : Array(LuckyApiSwagger::ActionObject)

    def initialize
      @store = [] of LuckyApiSwagger::ActionObject
    end

    def add(action : LuckyApiSwagger::ActionObject)
      @store << action
    end

    def self.add(action : LuckyApiSwagger::ActionObject)
      INSTANCE.add(action)
    end

    def self.swag_store
      INSTANCE.store
    end
  end
end
