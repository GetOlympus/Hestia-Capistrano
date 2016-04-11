# Files
namespace :files do

  desc "Create shared files"
  task :before_action do
    on release_roles(:all) do

      # Create temporary (fake) files for symlinks
      fetch(:linked_files).each do |file|
        puts " "
        puts "> Create #{file} temporary file".colorize(:light_black)

        execute :touch, "#{shared_path}/#{file}"
        execute :chmod, "644 #{shared_path}/#{file}"
      end

      # Special case
      puts " "
      puts "> Create .tmp temporary file".colorize(:light_black)

      execute :touch, "#{shared_path}/.tmp"
      execute :chmod, "644 #{shared_path}/.tmp"

      puts "end :files:before_action".colorize(:light_blue)
      puts " "

    end
  end

  desc "Create useful files"
  task :after_action do
    on release_roles(:all) do

      # Special case
      if test "[ -f \"#{shared_path}/.tmp\" ]"
        puts " "
        puts "> Remove .tmp temporary file".colorize(:light_black)

        execute :rm, "#{shared_path}/.tmp"
      end

      # Create .htaccess file
      puts " "
      puts "> Copy .htaccess file".colorize(:light_blue)

      execute :cp, "#{release_path}/web/.htaccess.dist", "#{release_path}/web/.htaccess"
      execute :chmod, "644 #{release_path}/web/.htaccess"

      # Create robots.txt file
      if fetch(:stage) == :staging then
        puts " "
        puts "> Copy robots.txt file for production environment with '#{fetch(:stage_url)}' url".colorize(:light_blue)

        execute :cp, "#{release_path}/web/robots.txt.dist", "#{release_path}/web/robots.txt"
        execute :chmod, "644 #{release_path}/web/robots.txt"
        execute :sed, "-i 's|http://www.domain.tld|#{fetch(:stage_url)}|g' #{release_path}/web/robots.txt"
      else
        puts " "
        puts "> Create robots.txt file for staging environment".colorize(:light_blue)

        execute :cp, "#{release_path}/web/robots.txt.dist", "#{release_path}/web/robots.txt"
        execute "echo \"User-agent: *\\nDisallow: /\\n\" > #{release_path}/web/robots.txt"
        execute :chmod, "644 #{release_path}/web/robots.txt"
      end

      puts "end :files:after_action".colorize(:light_blue)
      puts " "

    end
  end

end
