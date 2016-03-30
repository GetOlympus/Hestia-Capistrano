module Capistrano
  class FileNotFound < StandardError
  end
end

# Deploy
namespace :deploy do

  desc "Create files and dirs when its needed"
  task :setup do
    on release_roles(:all) do

      # Check the very last action made: it means all setup processes are done!
      if test "[ ! -f \"#{shared_path}/web/robots.txt\" ]"
        puts "Create directories"
        invoke "directories:do_actions"

        puts "Create files"
        invoke "files:do_actions"
      end

    end
  end

  desc "Restart services and clear caches"
  task :clear do
    on release_roles(:all) do

      puts "Restart all services"
      invoke "server:stop"
      invoke "php:restart"
      invoke "server:start"

      puts "Clear all caches"
      invoke "redis:flushall"
      invoke "pagespeed:flushall"
      invoke "varnish:restart"

    end
  end

  # Create files and dirs when its needed
  before 'deploy:starting', 'deploy:setup'

  # Restart services and clear caches
  after :publishing, 'deploy:clear'

end
