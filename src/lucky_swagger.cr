require "./lucky_swagger/*"
require "./version"

module LuckySwagger
  def self.build
    builder = Swagger::Builder.new(
      title: config.title,
      version: config.version,
      description: config.description,
      terms_url: config.terms_url,
      license: Swagger::License.new(*config.license),
      contact: Swagger::Contact.new(*config.contact)

      # TODO: Add authorization using JWT
    )
    ActionStore.swagger_actions.each do |swagger_action|

    end
  end
end
