require_relative "lib/ccavenue_payment/version"
require_relative "lib/ccavenue_payment/config"
require_relative "lib/ccavenue_payment/crypto"
require_relative 'lib/ccavenue_payment'

Gem::Specification.new do |spec|
  spec.name          = "ccavenue_payment"
  spec.version       = CcavenuePayment::VERSION
  spec.authors       = ["Dang Chi"]
  spec.email         = ["dangtanminhchi@gmail.com"]

  spec.summary       = %q{CCAvenue billing page (Non-Seamless)}
  spec.description   = %q{CCCAvenue Payment Gateway - CCAvenue billing page (Non-Seamless)}
  spec.homepage      = "https://github.com/chidang/ccavenue_payment"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/chidang/ccavenue_payment"
  spec.metadata["changelog_uri"] = "https://github.com/chidang/ccavenue_payment/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency('bundler', '~> 2.2')
  spec.add_development_dependency('rake', '~> 12.0')
  spec.add_development_dependency('rspec', '~> 3.0')
  spec.add_dependency 'figaro', '~> 1.1', '>= 1.1.1'
end
