# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = 'capistrano-olympus'
  gem.version       = '0.0.1'
  gem.authors       = ['Achraf Chouk']
  gem.email         = ['achrafchouk@gmail.com']
  gem.description   = %q{WordPress support for Capistrano 3.x and Olympus framework}
  gem.summary       = %q{WordPress support for Capistrano 3.x and Olympus framework}
  gem.homepage      = 'http://github.com/crewstyle/capistrano-olympus'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }

  # no tests as of yet
  #gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})

  gem.require_paths = ['lib']

  gem.add_dependency 'capistrano', '~> 3.4'
  gem.add_dependency 'capistrano-composer'
  gem.add_dependency 'sshkit-sudo'
end
