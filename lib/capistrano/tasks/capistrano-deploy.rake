module Capistrano
  class FileNotFound < StandardError
  end
end

# Deploy
namespace :deploy do

  desc "Initialize"
  task :initialize do
    on release_roles(:all) do

      # Check the very last action made: it means all setup processes are done!
      if test "[ ! -f \"#{shared_path}/web/robots.txt\" ]"
        puts "Create directories".colorize(:light_blue)
        invoke "directories:do_actions"

        puts "Create files".colorize(:light_blue)
        invoke "files:do_init"
      end

    end
  end

  desc "Install"
  task :install do
    on release_roles(:all) do

      # Run composer install
      invoke "composer:install"

      # Link files
      invoke "files:do_link"

      # Create files and dirs when its needed
      invoke "database:do_actions"

    end
  end

  desc "Restart services and clear caches"
  task :clear do
    on release_roles(:all) do

      #Do nothing for now...

      #puts "Restart all services"
      #invoke "server:stop"
      #invoke "php:restart"
      #invoke "server:start"

      #puts "Clear all caches"
      #invoke "redis:flushall"
      #invoke "pagespeed:flushall"
      #invoke "varnish:restart"

    end
  end

  # Initialize
  before :starting, 'deploy:initialize'
  after :starting, 'deploy:install'

  # Restart services and clear caches
  after :publishing, 'deploy:clear'

end
