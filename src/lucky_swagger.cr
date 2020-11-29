require "./lucky_swagger/*"
require "./version"

# Lucky Swagger helper. Middleware that can be used with
# Lucky framework to create a swagger endpoint.
#
# Consider adding followind to the config/swagger.cr
#
# ```
# LuckySwagger.configure do |settings|
#   settings.title = "My API application"
#   settings.version = ENV["APP_VERSION"]
#   settings.description = "Application description"
#   settings.terms_url = "https://github.com/me/project/TERMS_OF_USE"
# end
# ```
#
# Then add following to the src/app_server.cr:
#
# ```
# swagger = LuckySwagger::Middleware.new
# ...[
#   # Right before Lucky::RouteNotFoundHandler.new
#   swagger.api_handler,
#   swagger.web_handler,
#
#   Lucky::RouteNotFoundHandler.new,
# ]
# ```
#
# TODO: Support 'license' and 'contacts' setting
module LuckySwagger
  Habitat.create do
    setting app_name : String
    setting version : String
    setting uri : String
    setting description : String? | Nil
    setting terms_url : String? | Nil
  end
end
