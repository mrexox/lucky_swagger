require "./action_object"

module LuckySwagger
  class ActionStore
    INSTANCE = new

    getter store : Array(LuckySwagger::ActionObject)

    def initialize
      @store = [] of LuckySwagger::ActionObject
    end

    def add(action : LuckySwagger::ActionObject)
      @store << action
    end

    def self.add(action : LuckySwagger::ActionObject)
      INSTANCE.add(action)
    end

    def self.swag_store
      INSTANCE.store
    end
  end
end
