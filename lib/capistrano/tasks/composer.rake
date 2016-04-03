# Composer
namespace :composer do

  desc "Composer run install"
  task :install do
    on release_roles(:all) do

      puts "Install composer vendors in #{release_path}".colorize(:light_blue)
      execute "cd #{release_path} && composer install --quiet"

    end
  end

end
