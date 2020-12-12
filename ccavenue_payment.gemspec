lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ccavenue/version'

Gem::Specification.new do |s|
  s.name = "ccavenue_payment"
  s.version = Ccavenue::VERSION
  s.date = %q{2020-12-11}
  s.summary = %q{CCAvenue billing page (Non-Seamless)}
  s.authors       = 'Chi Dang'
  s.email         = 'dangtanminhchi@gmail.com'
  s.description   = %q{Avoid the hassle of developing and managing your own checkout page. Use the customizable billing page provided by CCAvenue which enables you to collect billing and shipping information of the customer.}
  s.summary       = %q{Encryption & Decryption }
  s.homepage      = 'https://github.com/chidang/ccavenue_payment'
  s.license       = 'MIT'
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency('figaro', '~> 1.1')
end 