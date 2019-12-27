require "habitat"

module LuckySwagger
  # TODO: add examples
  Habitat.create do
    setting title : String = "Swagger"
    setting version : String
    setting description : String?
    setting terms_url : String?
    setting license : {String, String?}
    setting contact : {String, String?}
    setting authorizations : Array(String)
  end
end
