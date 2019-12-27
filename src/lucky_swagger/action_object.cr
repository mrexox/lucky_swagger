require "./errors"

module LuckySwagger
  class ActionObject
    getter params : SwaggerParams

    alias SwaggerParams = Hash(Symbol, String | Symbol | Bool)

    def initialize(method : Symbol, swagger_params : SwaggerParams)
      @params = {
        :description   => swagger_params[:description],
        :uri           => swagger_params[:uri],
        :authorization => swagger_params[:authorization],
        :method        => method,
      }
    end

    def apply(&block)
      with self yield
    end

    def param(parameter : Symbol, description : String?)
      # @params[:parameters] ||= [] of {Symbol, String?}
      @params[:parameters] = parameter
    end

    def success(code : Int32 | String, description : String?)
      raise CodeExists.new(code, description) if @params.has_key? :success
      @params[:success] = code.to_s
    end

    def error(code : Int32 | String, description : String?)
      raise CodeExists.new(code, description) if @params.has_key? :error
      @params[:error] = code.to_s
    end
  end
end
