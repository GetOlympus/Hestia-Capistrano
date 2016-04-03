require 'colorize'
require 'sshkit/sudo'

# Core tasks for deploying Olympus framework with WordPress and composer
load File.expand_path("../tasks/capistrano-deploy.rake", __FILE__)
load File.expand_path("../tasks/composer.rake", __FILE__)
load File.expand_path("../tasks/database.rake", __FILE__)
load File.expand_path("../tasks/directories.rake", __FILE__)
load File.expand_path("../tasks/files.rake", __FILE__)
load File.expand_path("../tasks/htaccess.rake", __FILE__)
load File.expand_path("../tasks/pagespeed.rake", __FILE__)
load File.expand_path("../tasks/php.rake", __FILE__)
load File.expand_path("../tasks/redis.rake", __FILE__)
load File.expand_path("../tasks/robots.rake", __FILE__)
load File.expand_path("../tasks/server.rake", __FILE__)
load File.expand_path("../tasks/varnish.rake", __FILE__)

# Load defaults variables
namespace :load do

  desc "Include defaults vars"
  task :defaults do
    load "capistrano/vars/defaults.rb"
  end

end
