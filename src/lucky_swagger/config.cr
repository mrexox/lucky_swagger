require "habitat"

module LuckySwagger

  # Example:
  # LuckySwagger.config do |config|
  #  config.title = "My API application"
  #  config.version = ENV["APP_VERSION"]
  #  config.description = "Application description"
  #  config.terms_url = "https://github.com/me/project/TERMS_OF_USE"
  #  config.license = {"MIT", "https://github.com/me/project/LICENSE"}
  #  config.contact = {"me", "mymail@mail.ru", "mysite.com"}
  # end

  Habitat.create do
    setting title : String = "Swagger"
    setting version : String
    setting description : String?
    setting terms_url : String?
    setting license : {String, String?}
    setting contact : {String, String?}

    # Authorization is not supported yet
    # setting authorizations : Array(String)
  end
end
