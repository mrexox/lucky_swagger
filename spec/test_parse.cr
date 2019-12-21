require "../src/lucky_api_swagger"

class SomeApiAction
  include LuckyApiSwagger::ApiAction

  get "/users", "Get user by id", { authorization: false } do
    param :id, "Path"

    success 200, "Successful"
    error   404, "Not found"
  end
end
