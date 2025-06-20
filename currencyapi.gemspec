# frozen_string_literal: true

require_relative "lib/currencyapi/version"

Gem::Specification.new do |spec|
  spec.name = "currencyapi"
  spec.version = Currencyapi::VERSION
  spec.authors = ["Marcos Vicente"]
  spec.email = ["marcosvicentesiqueira@gmail.com"]

  spec.summary = "currencyapi-ruby is a simple Ruby wrapper for the CurrencyAPI."
  spec.description = "is a simple Ruby wrapper for the CurrencyAPI, providing easy access to real-time and historical foreign exchange rates. It allows developers to integrate currency conversion and exchange rate data into Ruby applications with minimal setup."
  spec.homepage = "https://github.com/marcosvicente/currencyapi"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.21"
  spec.add_development_dependency "pry"
  spec.add_dependency "httparty", '0.23.1'
  spec.add_dependency "activesupport", '>= 4.2'
  spec.add_dependency "dry-struct", '>=1.8.0'

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/marcosvicente/currencyapi"
  spec.metadata["changelog_uri"] = "https://github.com/marcosvicente/currencyapi/CHANGELOG."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
