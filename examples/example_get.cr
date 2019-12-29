require "../src/lucky_swagger"

module LuckySwagger
  module Fa
    include ApiAction
    get "/lol", "Hi" do
      puts 2
    end
  end
end
