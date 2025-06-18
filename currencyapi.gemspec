# frozen_string_literal: true

require_relative "lib/currencyapi/version"

Gem::Specification.new do |spec|
  spec.name = "currencyapi"
  spec.version = Currencyapi::VERSION
  spec.authors = ["Marcos Vicente"]
  spec.email = ["marcosvicentesiqueira@gmail.com"]

  spec.summary = "currencyapi-ruby is a simple Ruby wrapper for the CurrencyAPI."
  spec.description = "is a simple Ruby wrapper for the CurrencyAPI, providing easy access to real-time and historical foreign exchange rates. It allows developers to integrate currency conversion and exchange rate data into Ruby applications with minimal setup."
  spec.homepage = "github.com/marcosvicente."
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "github.com/marcosvicente"
  spec.metadata["changelog_uri"] = "github.com/marcosvicente."

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
