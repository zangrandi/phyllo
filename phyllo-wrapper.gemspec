$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "phyllo-wrapper/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "phyllo-wrapper"
  spec.version     = PhylloWrapper::VERSION
  spec.authors     = ["Magiclinks"]
  spec.email       = ["augusto@magiclinks.com"]
  spec.homepage    = "https://www.magiclinks.com"
  spec.summary     = "Phyllo Wrapper"
  spec.description = "Phylo Wrapper"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.add_dependency "httparty", "~> 0.18.1"
end
