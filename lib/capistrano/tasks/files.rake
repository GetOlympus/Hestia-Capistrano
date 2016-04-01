# Files
namespace :files do

  desc "Creates files"
  task :do_actions do
    on release_roles(:all) do

      # Create DB files, and install data
      invoke "database:do_actions"

      # Create .htaccess
      invoke "htaccess:do_actions"

      # Create robots.txt
      invoke "robots:do_actions"

    end
  end

end
