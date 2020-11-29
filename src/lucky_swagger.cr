require "./lucky_swagger/*"
require "./version"

module LuckySwagger
  # Example: config/swagger.cr
  #
  #   LuckySwagger.configure do |settings|
  #    settings.title = "My API application"
  #    settings.version = ENV["APP_VERSION"]
  #    settings.description = "Application description"
  #    settings.terms_url = "https://github.com/me/project/TERMS_OF_USE"
  #   end

  Habitat.create do
    setting app_name : String
    setting version : String
    setting uri : String
    setting description : String? | Nil
    setting terms_url : String? | Nil

    # TODO: Support these settings
    # setting license : {String, String?} | Nil
    # setting contact : {String, String?, String?} | Nil
  end
end
