require "swagger"
require "swagger/http/server"

builder = Swagger::Builder.new(
  title: "App API",
  version: "1.0.0",
  description: "This is a sample api for users",
  terms_url: "http://yourapp.com/terms",
  license: Swagger::License.new("MIT", "https://github.com/icyleaf/swagger/blob/master/LICENSE"),
  contact: Swagger::Contact.new("icyleaf", "icyleaf.cn@gmail.com", "http://icyleaf.com"),
  authorizations: [
    Swagger::Authorization.jwt(description: "Use JWT Auth"),
  ]
)

builder.add(Swagger::Controller.new("Users", "User resources", [
  Swagger::Action.new("get", "/users", "All users"),
  Swagger::Action.new("get", "/users/{id}", "Get user by id", parameters: [
    Swagger::Parameter.new("id", "path")
  ], responses: [
    Swagger::Response.new("200", "Success response"),
    Swagger::Response.new("404", "Not found user")
  ], authorization: true),
  Swagger::Action.new("post", "/users", "Create User", responses: [
    Swagger::Response.new("201", "Return user resource after created"),
    Swagger::Response.new("401", "Unauthorizated")
  ], authorization: false)
]))

document = builder.built

Swagger::HTTP::Server.run(document)


# desc 'All users' do
#   get '/users', 'Get user by id', authorization: false do
#     param :id, "Path"
#
#     success 200, 'Successful'
#     error   404, 'Not found'
#   end
# end
