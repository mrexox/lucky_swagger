require "../src/lucky_swagger/api_action"

module LuckyApiSwagger
  module ApiAction
    include
    get "/lol", "Hi"do
      puts 2
    end
  end
end
