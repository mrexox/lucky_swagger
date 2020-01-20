require "./action_object"

module LuckySwagger
  # Include this module in src/actions/api_action.cr
  module ApiAction
    private macro swagger_method(method)
      def self.{{method.id}}(uri : String, description : String, params : NamedTuple? = nil, &block)
        {% if env("LUCKY_SWAGGER_ENABLED") %}
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
        {% else %}
          # Do nothing
        {% end %}
      end
    end




    macro included
      @@action_store = [] of LuckySwagger::ActionObject

      def self.build_action(method : Symbol, params : Hash)
        action = LuckySwagger::ActionObject.new(method, params)
        LuckySwagger::ActionStore.add(action)
        action
      end

      swagger_method :get
      swagger_method :post
      swagger_method :patch
      swagger_method :put
      swagger_method :delete
    end
  end
end
