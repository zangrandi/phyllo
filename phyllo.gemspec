$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "phyllo/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "phyllo"
  spec.version     = Phyllo::VERSION
  spec.authors     = ["Augusto Zangrandi"]
  spec.email       = ["augustozangrandi@gmail.com"]
  spec.homepage    = "https://www.getphyllo.com"
  spec.summary     = "Phyllo Ruby Wrapper"
  spec.description = "Phylo Ruby Wrapper"
  spec.license     = "MIT"

  spec.add_dependency "httparty", "~> 0.18.1"
end
