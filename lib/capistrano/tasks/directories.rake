# Directories
namespace :directories do

  desc "Creates directories"
  task :do_actions do
    on release_roles(:all) do

      if test "[ ! -d \"#{shared_path}/app/config\" ]"
        puts "Create app/config folder".colorize(:light_blue)
        execute :mkdir, '-p', "#{shared_path}/app/config"
      end

      fetch(:linked_dirs).each do |folder|
        if test "[ ! -d \"#{shared_path}/#{folder}\" ]"
          puts "Create #{folder} folder".colorize(:light_blue)
          execute :mkdir, '-p', "#{shared_path}/#{folder}"

          if test "[ -d \"#{release_path}/#{folder}\" ]"
            execute :rm, '-rf', "#{release_path}/#{folder}"
          end
        end
      end

    end
  end

end
