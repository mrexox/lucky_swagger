module LuckyApiSwagger
  class CodeExists < Exception
    getter code

    def initialize(@code : Int32, description : String?)
      super("Code: #{@code} (#{description})")
    end
  end
end
