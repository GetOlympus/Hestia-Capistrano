module Capistrano
  class FileNotFound < StandardError
  end
end

# Deploy
namespace :deploy do

  desc "Install composer vendors"
  task :composer do
    invoke "composer:install"
  end

  desc "Create files and dirs when its needed"
  task :filesystem do
    on release_roles(:all) do

      # Check the very last action made: it means all setup processes are done!
      if test "[ ! -f \"#{shared_path}/web/robots.txt\" ]"
        puts "Create directories".colorize(:light_blue)
        invoke "directories:do_actions"

        puts "Create files".colorize(:light_blue)
        invoke "files:do_actions"
      end

    end
  end

  desc "Install database useful files"
  task :database do
    invoke "database:do_actions"
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

  # Initialize composer
  after :starting, 'deploy:composer'
  after :starting, 'deploy:filesystem'
  after :starting, 'deploy:database'

  # Restart services and clear caches
  after :publishing, 'deploy:clear'

end
