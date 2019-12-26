require "swagger/http/handler"
require "swagger/http/handlers/api"

module LuckyApiSwagger
  # A handler is to be inserted in lucky's src/app_server.cr
  #
  # Example:
  #    def middleware : Array(HTTP::Handler)
  #      [
  #       ...
  #       LuckyApiSwagger::RouteHandler.new,
  #       ...
  #      ]
  #    end
  class RouteHandler < Swagger::HTTP::APIHandler
    # TODO: customize swagger_path using settings
    private def swagger_path
      "/v#{Swagger::OPENAPI_MAJAR_VERSION}/swagger.json"
    end
  end
end
