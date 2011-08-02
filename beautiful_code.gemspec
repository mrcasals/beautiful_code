# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "beautiful_code/version"

Gem::Specification.new do |s|
  s.name        = "beautiful_code"
  s.version     = BeautifulCode::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Marc Riera Casals"]
  s.email       = ["mrc2407@gmail.com"]
  s.homepage    = "https://github.com/mrc2407/beautiful_code"
  s.summary     = %q{Convert files into BMP images with this gem}
  s.description = %q{Convert files into BMP images with this gem}

  s.rubyforge_project = "beautiful_code"

  s.add_runtime_dependency 'rmagick'

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'bluecloth'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
