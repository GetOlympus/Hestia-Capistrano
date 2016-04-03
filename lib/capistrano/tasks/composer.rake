# Composer
namespace :composer do

  desc "Composer run install"
  task :install do
    on release_roles(:all) do
      within :release_path do

        puts "Install composer vendors in #{:release_path}".colorize(:light_blue)
        execute :composer, :install

      end
    end
  end

end
