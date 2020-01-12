# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Specifications
Gem::Specification.new do |gem|
  gem.name          = 'olympus-hestia-capistrano'
  gem.version       = '0.0.10'
  gem.date          = Time.now.strftime("%Y-%m-%d")
  gem.authors       = ['Achraf Chouk']
  gem.email         = ['achrafchouk@gmail.com']
  gem.description   = 'Olympus Hestia Capistrano is a Capistrano bundle tasks for deploying WordPress website easily with the Olympus package.'
  gem.summary       = 'Ruby gem which provides a complete solution for deploying WordPress website with the Olympus package.'
  gem.homepage      = 'https://github.com/GetOlympus/Hestia-Capistrano'
  gem.license       = 'MIT'

  gem.files         = [
    'CHANGELOG.md',
    'LICENSE',
    'README.md',
    'olympus-hestia-capistrano.gemspec',
    'lib/olympus-hestia.rb',
    'lib/capistrano/olympus-hestia.rb',
    'lib/capistrano/tasks/database.rake',
    'lib/capistrano/tasks/deploy.rake',
    'lib/capistrano/tasks/directories.rake',
    'lib/capistrano/tasks/files.rake',
    'lib/capistrano/vars/defaults.rb',
  ]
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }

  # no tests as of yet
  #gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})

  gem.require_paths = ['lib']

  gem.add_dependency 'capistrano', '~> 3.4'
  gem.add_dependency 'capistrano-composer', '~> 0.0.3'
  gem.add_dependency 'colorize', '~> 0.7.7'
  gem.add_runtime_dependency 'capistrano-file-permissions', '~> 1.0', '>= 1.0.0'
end
