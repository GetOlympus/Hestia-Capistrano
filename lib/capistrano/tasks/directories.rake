# Directories
namespace :directories do

  desc "Creates directories"
  task :do_actions do
    on release_roles(:all) do

      if test "[ ! -d \"#{shared_path}/tmp\" ]"
        execute :mkdir, '-p', "#{shared_path}/tmp"
      end

      if test "[ ! -d \"#{shared_path}/app/config/env\" ]"
        execute :mkdir, '-p', "#{shared_path}/app/config/env"
      end

      if test "[ ! -d \"#{shared_path}/web/statics/languages\" ]"
        execute :mkdir, '-p', "#{shared_path}/web/statics/languages"
      end

      if test "[ ! -d \"#{shared_path}/web/statics/plugins\" ]"
        execute :mkdir, '-p', "#{shared_path}/web/statics/plugins"
      end

      if test "[ ! -d \"#{shared_path}/web/statics/uploads\" ]"
        execute :mkdir, '-p', "#{shared_path}/web/statics/uploads"
      end

    end
  end

end
