require "./errors"

module LuckyApiSwagger
  class ActionObject
    getter params

    def initialize(method : Symbol, @params : NamedTuple(authorization: Bool, description: String))
      @params[:method] = method
    end

    def apply(&block)
      with self yield
    end

    def param(parameter : Symbol, description : String?)
      @params[:parameters] ||= [] of {Symbol, String?}
      @params[:parameters] << { parameter, description }
    end

    def success(code : Int32, description : String?)
      raise CodeExists.new(code, description) unless @params[:success].nil?
      @params[:success] = code
    end

    def error(code : Int32, description : String?)
      raise CodeExists.new(code, description) unless @params[:error].nil?
      @params[:error] = code
    end
  end
end
