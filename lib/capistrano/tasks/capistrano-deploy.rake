module Capistrano
  class FileNotFound < StandardError
  end
end

# Deploy
namespace :deploy do

  # Initialize
  before 'deploy:starting', 'custom:initialize'
  before 'deploy:updating', 'custom:install'
  #after :starting, 'custom:install'

  # Restart services and clear caches
  after 'deploy:publishing', 'custom:clear'

end

# Custom tasks
namespace :custom do

  desc "Initialize"
  task :initialize do
    on release_roles(:all) do

      puts " "
      puts "Running deploy:initialize task".colorize(:color => :light_green, :mode => :bold)
      puts " "

      # Check the very last action made: it means all setup processes are done!
      if test "[ ! -f \"#{shared_path}/web/robots.txt\" ]"
        puts "Create directories".colorize(:light_blue)
        invoke "directories:do_actions"
      end

    end
  end

  desc "Install"
  task :install do
    on release_roles(:all) do

      puts " "
      puts "Running deploy:install task".colorize(:color => :light_green, :mode => :bold)
      puts " "

      # Run composer install
      invoke "composer:install"

      # Link files
      invoke "files:do_action"

      # Create files and dirs when its needed
      invoke "database:do_actions"

    end
  end

  desc "Restart services and clear caches"
  task :clear do
    on release_roles(:all) do

      puts " "
      puts "Running deploy:clear task".colorize(:color => :light_green, :mode => :bold)
      puts " "

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

end