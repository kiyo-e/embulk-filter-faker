
Gem::Specification.new do |spec|
  spec.name          = "embulk-filter-faker"
  spec.version       = "0.1.2"
  spec.authors       = ["kiyo-e"]
  spec.summary       = "Faker filter plugin for Embulk"
  spec.description   = "Faker"
  spec.email         = ["kiyo-e@users.noreply.github.com"]
  spec.licenses      = ["MIT"]
  # TODO set this: spec.homepage      = "https://github.com/kiyo-e/embulk-filter-faker"

  spec.files         = `git ls-files`.split("\n") + Dir["classpath/*.jar"]
  spec.test_files    = spec.files.grep(%r{^(test|spec)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'faker'
  spec.add_development_dependency 'embulk', ['>= 0.9.7']
  spec.add_development_dependency 'bundler', ['>= 1.10.6']
  spec.add_development_dependency 'rake', ['>= 10.0']
end
