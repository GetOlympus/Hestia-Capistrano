# Database
namespace :database do

  desc "Creates files"
  task :do_actions do
    on release_roles(:all) do

      # Ask configs
      set :database_host, ask("Enter the database hostname:".colorize(:magenta), 'localhost')
      set :database_name, ask("Enter the database name:".colorize(:magenta), 'database_name_here')
      set :database_user, ask("Enter the database user:".colorize(:magenta), 'username_here')
      set :database_pass, ask("Enter the database password:".colorize(:magenta), 'password_here', echo: false)

      set :wordpress_name, ask("Enter the admin username:".colorize(:magenta), 'admin')
      set :wordpress_mail, ask("Enter the admin email address:".colorize(:magenta), 'admin@domain.tld')
      set :wordpress_pass, ask("Enter the admin password:".colorize(:magenta), 'password', echo: false)


      # Create database
      puts "Create database.sql file".colorize(:light_blue)

      io = StringIO.new("CREATE DATABASE IF NOT EXISTS `#{fetch(:database_name)}`;")
      upload! io, File.join(shared_path, "database.sql")

      execute :chmod, "644 #{shared_path}/database.sql"
      execute :mysql, "-u #{fetch(:database_user)} -p#{fetch(:database_pass)} -h #{fetch(:database_host)} < #{shared_path}/database.sql"
      execute :rm, "#{shared_path}/database.sql"


      # Execute WordPress SQL requests
      puts "Execute wp-cli commands to install WordPress SQL requests".colorize(:light_blue)

      if test "[ ! -f \"#{release_path}/wp-cli.yml\" ]"
        puts "Create wp-cli.yml file".colorize(:light_blue)

        io = StringIO.new("path: web/cms\n")
        upload! io, File.join(release_path, "wp-cli.yml")
        execute :chmod, "644 #{release_path}/wp-cli.yml"
      end

      execute "wp core install --url=#{fetch(:localurl)} --title=#{fetch(:application)} --admin_user=#{fetch(:wordpress_name)} --admin_password=#{fetch(:wordpress_pass)} --admin_email=#{fetch(:wordpress_mail)}"

    end
  end

end
