lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ccavenue_payment/version'

Gem::Specification.new do |s|
  s.name = "ccavenue_payment"
  s.version = CcavenuePayment::VERSION
  s.date = %q{2020-12-11}
  s.summary = %q{CCAvenue billing page (Non-Seamless)}
  s.authors       = 'Chi Dang'
  s.email         = 'dangtanminhchi@gmail.com'
  s.description   = %q{Avoid the hassle of developing and managing your own checkout page. Use the customizable billing page provided by CCAvenue which enables you to collect billing and shipping information of the customer.}
  s.summary       = %q{Encryption & Decryption }
  s.homepage      = '#'
  s.license       = 'MIT'
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end 