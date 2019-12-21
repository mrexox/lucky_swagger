require "./action_store"
require "./action_object"

module LuckyApiSwagger

  # Include this module in src/actions/api_action.cr
  module ApiAction
    def self.build_action(method : Symbol, params : NamedTuple?, &block)
      action = ActionObject.new(method, params)
      action.apply(block)
      ActionStore.add(action)
    end

    private macro define_action(method)
      def self.{{method.id}}(uri : String, description : String, params : NamedTuple?, &block)
        parameters = params || NamedTuple.new

        build_action(
          {{method}},
          parameters.merge(
            uri: uri,
            description: description
          ),
          &block
        )
      end
    end

    macro included
      define_action :get
      define_action :post
      define_action :patch
      define_action :put
      define_action :delete
    end
  end
end
