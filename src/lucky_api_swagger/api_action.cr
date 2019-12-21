require "./store"

module LuckyApiSwagger

  # Include this module in src/actions/api_action.cr
  module ApiAction
    def self.build_action(method, params, &block)
      # Create a store object
      # Execute a block with it
    end

    private macro define_action(method)
      def self.{{method.id}}(uri, description, params, &block)
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

    define_action :get
    define_action :post
    define_action :patch
    define_action :put
    define_action :delete
  end
end
