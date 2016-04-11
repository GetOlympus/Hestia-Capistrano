module Capistrano
  class FileNotFound < StandardError
  end
end

# Deploy
namespace :deploy do

  task :message_start do
    puts " "
    puts " Start deploy ".colorize(:color => :black, :background => :green)
    puts " "
  end
  task :message_finish do
    puts " "
    puts " Finish deploy ".colorize(:color => :black, :background => :green)
    puts " "
  end

  desc "Initialize folders"
  task :init_folders do
    on release_roles(:all) do

      puts " "
      puts "Running deploy:init_folders task".colorize(:color => :light_green, :mode => :bold, :mode => :underline)
      puts " "

      # Linked dirs
      # Check the very last action made: it means all setup processes are done!
      if test "[ ! -f \"#{shared_path}/web/robots.txt\" ]"
        invoke "directories:do_actions"
      end

    end
  end

  desc "Initialize files and database"
  task :init_files do
    on release_roles(:all) do

      puts " "
      puts "Running deploy:init_files task".colorize(:color => :light_green, :mode => :bold)
      puts " "

      # Linked files
      # Check the very last action made: it means all setup processes are done!
      if test "[ ! -f \"#{shared_path}/web/robots.txt\" ]"
        invoke "files:before_action"
      end

    end
  end

  desc "Initialize files, database, composer, and all"
  task :init_all do
    on release_roles(:all) do

      puts " "
      puts "Running deploy:init_all task".colorize(:color => :light_green, :mode => :bold)
      puts " "

      # Check the very last action made: it means all setup processes are done!
      if test "[ -f \"#{shared_path}/.tmp\" -o ! -f \"#{shared_path}/web/robots.txt\" ]"
        # Composer install
        invoke "composer:install"

        # Linked files
        invoke "files:after_action"

        # Create database
        invoke "database:do_actions"

        # Install WP
        invoke "database:wp_cli"
      else
        # Composer install
        invoke "composer:install"
      end

    end
  end

  desc "Restart services and clear caches"
  task :clear_caches do
    on release_roles(:all) do

      puts " "
      puts "Running deploy:clear_caches task".colorize(:color => :light_green, :mode => :bold)
      puts " "

      #Do nothing for now...

    end
  end

  # Messages
  before 'deploy:starting', 'deploy:message_start'
  after 'deploy:finished', 'deploy:message_finish'

  # Initialize
  before 'deploy:starting', 'deploy:init_folders'
  before 'deploy:check', 'deploy:init_files'
  after 'deploy:updating', 'deploy:init_all'

  # Restart services and clear caches
  after 'deploy:publishing', 'deploy:clear_caches'

end
