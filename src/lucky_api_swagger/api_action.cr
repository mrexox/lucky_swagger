require "./action_object"

module LuckyApiSwagger
  # Include this module in src/actions/api_action.cr
  module ApiAction
    private macro define_action(method)
      def self.{{method.id}}(uri : String, description : String, params : NamedTuple?, &block)
        parameters = params || NamedTuple.new

        with build_action(
          {{method}},
          parameters.to_h.merge(
            {
              :uri => uri,
              :description => description,
              :authorization => true
            }
          )
        ) yield
      end
    end

    macro included
      @@action_store = [] of LuckyApiSwagger::ActionObject

      def self.build_action(method : Symbol, params : Hash)
        action = LuckyApiSwagger::ActionObject.new(method, params)
        LuckyApiSwagger::ActionStore.add(action)
        action
      end

      define_action :get
      define_action :post
      define_action :patch
      define_action :put
      define_action :delete
    end
  end
end
