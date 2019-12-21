module LuckyApiSwagger
  class CodeExists < Exception
    getter code

    def initialize(@code : Symbol, description : String?)
      super("Code: #{@code} (#{description})")
    end
  end
end
