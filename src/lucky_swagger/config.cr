require "habitat"

module LuckySwagger

  # Example:
  # LuckySwagger.configure do |settings|
  #  settings.title = "My API application"
  #  settings.version = ENV["APP_VERSION"]
  #  settings.description = "Application description"
  #  settings.terms_url = "https://github.com/me/project/TERMS_OF_USE"
  #  settings.license = {"MIT", "https://github.com/me/project/LICENSE"}
  #  settings.contact = {"me", "mymail@mail.ru", "mysite.com"}
  # end

  Habitat.create do
    setting app_name : String
    setting version : String
    setting description : String? | Nil
    setting terms_url : String? | Nil
    setting license : {String, String?} | Nil
    setting contact : {String, String?, String?} | Nil
  end
end
