require "habitat"

module LuckyApiSwagger
  # TODO: add examples
  Habitat.create do
    setting title : String = "Swagger"
    setting version : String
    setting description : String | Nil
    setting terms_url : String | Nil
    setting license : { String, String | Nil}
    setting contact : { String, String | Nil}
    setting authorizations [] of String | Nil
  end
end
