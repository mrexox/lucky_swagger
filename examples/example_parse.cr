require "../src/lucky_swagger"

class SomeApiAction
  include LuckySwagger::ApiAction

  get "/users", "Get user by id", {authorization: false} do
    param :id, "Path"

    success 200, "Successful"
    error 404, "Not found"
  end
end

class AnotherApiAction
  include LuckySwagger::ApiAction

  get "/posts", "Get posts", {authorization: false} do
    param :id, "Another path"

    success 200, "Successful"
    error 404, "Not found"
  end

  print LuckySwagger::ActionStore.swag_store
end
