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
      controllers = Hash(String, Array(Swagger::Action)).new
      Lucky::Router.routes.each do |route|
        scopes = route.action.to_s.split("::")
        scope = scopes.first
        description = scopes[1..].join(" ")
        controllers[scope] ||= [] of Swagger::Action
        controllers[scope].unshift(
          Swagger::Action.new(
          method: route.method.to_s, route: route.path, description: description, responses: [
            Swagger::Response.new("200", "Success response"),
          ]))
      end

      controllers.each do |scope, actions|
        builder.add(Swagger::Controller.new(scope, "", actions))
      end

      host = Lucky::ServerSettings.host
      port = Lucky::ServerSettings.port

      @api_handler = Swagger::HTTP::APIHandler.new(builder.built, "#{host}:#{port}#{settings.uri}")
      @web_handler = Swagger::HTTP::WebHandler.new(settings.uri, api_handler.api_url)
    end
  end
end
