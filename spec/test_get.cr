require "../src/lucky_api_swagger/api_action"

module LuckyApiSwagger
  module ApiAction
    def self.build_action(method, params, &block)
      print(method, params)
      block.call
    end

    get "/lol", "Hi", {hi: 2}  do
      puts 2
    end
  end
end
