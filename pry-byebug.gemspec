# frozen_string_literal: true

require File.dirname(__FILE__) + "/lib/pry-byebug/version"

Gem::Specification.new do |gem|
  gem.name = "pry-byebug"
  gem.version = PryByebug::VERSION
  gem.authors = ["David Rodríguez", "Gopal Patel"]
  gem.email = "deivid.rodriguez@gmail.com"
  gem.license = "MIT"
  gem.homepage = "https://github.com/deivid-rodriguez/pry-byebug"
  gem.summary = "Fast debugging with Pry."
  gem.description = "Combine 'pry' with 'byebug'. Adds 'step', 'next', 'finish',
    'continue' and 'break' commands to control execution."

  gem.files = Dir["lib/**/*.rb", "LICENSE"]
  gem.extra_rdoc_files = %w[CHANGELOG.md README.md]
  gem.require_path = "lib"
  gem.executables = []

  # Dependencies
  gem.required_ruby_version = ">= 2.7.0"

  gem.add_runtime_dependency "pry", ">= 0.13"
  gem.add_runtime_dependency "runger_byebug", ">= 11.0"
end
