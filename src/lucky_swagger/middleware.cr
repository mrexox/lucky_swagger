require "swagger"
require "swagger/http/handler"

module LuckySwagger
  class Middleware
    getter api_handler, web_handler

    def initialize
      settings = LuckySwagger.settings
      builder = Swagger::Builder.new(
        title: settings.app_name,
        version: settings.version,
        description: settings.description,
        terms_url: settings.terms_url,
        authorizations: [
          Swagger::Authorization.jwt(description: "Use JWT Auth"),
        ]
      )

      # Add routes
      controllers = [] of Swagger::Action
      Lucky::Router.routes.each do |route|
        controllers.unshift(
          Swagger::Action.new(
            method: route.method.to_s, route: route.path, responses: [
            Swagger::Response.new("200", "Success response"),
          ]))
      end
      builder.add(Swagger::Controller.new("All", "All endpoints", controllers))

      host = Lucky::ServerSettings.host
      port = Lucky::ServerSettings.port

      @api_handler = Swagger::HTTP::APIHandler.new(builder.built, "#{host}:#{port}#{settings.uri}")
      @web_handler = Swagger::HTTP::WebHandler.new(settings.uri, api_handler.api_url)
    end
  end
end
