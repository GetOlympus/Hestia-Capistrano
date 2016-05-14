# Directories
namespace :directories do

  desc "Creates directories"
  task :do_actions do
    on release_roles(:all) do

      # Create app/config folder
      if test "[ ! -d \"#{shared_path}/app/config\" ]"
        puts " "
        puts "> Create app/config folder".colorize(:light_blue)
        execute "#{fetch(:sudo)} mkdir -p #{shared_path}/app/config"
      end

      # Create all linked dirs
      fetch(:linked_dirs).each do |folder|
        if test "[ ! -d \"#{shared_path}/#{folder}\" ]"
          puts " "
          puts "> Create #{folder} folder".colorize(:light_blue)
          execute "#{fetch(:sudo)} mkdir -p #{shared_path}/#{folder}"

          if test "[ -d \"#{release_path}/#{folder}\" ]"
            execute "#{fetch(:sudo)} rm -rf #{release_path}/#{folder}"
          end
        end
      end

      puts "end :directories".colorize(:light_blue)
      puts " "

    end
  end

end
