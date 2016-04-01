# Directories
namespace :directories do

  desc "Creates directories"
  task :do_actions do
    on release_roles(:all) do

      if test "[ ! -d \"#{shared_path}/app/config\" ]"
        puts "Create app/config folder".colorize(:light_blue)
        execute :mkdir, '-p', "#{shared_path}/app/config"
      end

      if test "[ ! -d \"#{shared_path}/tmp\" ]"
        puts "Create tmp folder".colorize(:light_blue)
        execute :mkdir, '-p', "#{shared_path}/tmp"
      end

      if test "[ ! -d \"#{shared_path}/web/statics/languages\" ]"
        puts "Create web/statics/languages folder".colorize(:light_blue)
        execute :mkdir, '-p', "#{shared_path}/web/statics/languages"
      end

      if test "[ ! -d \"#{shared_path}/web/statics/plugins\" ]"
        puts "Create web/statics/plugins folder".colorize(:light_blue)
        execute :mkdir, '-p', "#{shared_path}/web/statics/plugins"
      end

      if test "[ ! -d \"#{shared_path}/web/statics/uploads\" ]"
        puts "Create web/statics/uploads folder".colorize(:light_blue)
        execute :mkdir, '-p', "#{shared_path}/web/statics/uploads"
      end

    end
  end

end
