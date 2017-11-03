if Rails.env.development? || Rails.env.test?
  require "factory_girl"

  namespace :dev do
    desc "Sample data for local development environment"
    task prime: "db:setup" do
      include FactoryGirl::Syntax::Methods
      User.create(email: "josh@jcmorrow.com", password: "password")
      Strategy.create(name: "Smithy Village")
      Strategy.create(name: "Village Idiot")
    end
  end
end
