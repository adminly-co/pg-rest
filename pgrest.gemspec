require_relative "lib/dash_api/version"

Gem::Specification.new do |spec|
  spec.name        = "pg_rest"
  spec.version     = PgRest::VERSION
  spec.authors     = ["Rami Bitar"]
  spec.email       = ["rami@skillhire.com"]
  spec.homepage    = "https://github.com/skillhire/pg_rest.git"
  spec.summary     = "REST API for postgres database migrations."
  spec.description = "REST API for remote postgres database migrations."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/skillhire/pg_rest.git"
  spec.metadata["changelog_uri"] = "https://github.com/skillhire/pg_rest.git"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.4", ">= 6.1.4.1"
  spec.add_dependency "pg"
  spec.add_dependency "dotenv-rails"

end