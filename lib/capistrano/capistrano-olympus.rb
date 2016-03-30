# Core tasks for deploying Olympus framework with WordPress
load File.expand_path("../tasks/capistrano-deploy.rake", __FILE__)

# Load defaults variables
namespace :load do

  task :defaults do
    load "capistrano/vars/defaults.rb"
  end

end
