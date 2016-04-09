# Files
namespace :files do

  desc "Creates files"
  task :do_actions do
    on release_roles(:all) do

      # Create robots.txt file
      if fetch(:stage) == :production then
        puts "Copy robots.txt file for production environment".colorize(:light_blue)

        execute :cp, "#{release_path}/web/robots.txt.dist", "#{release_path}/web/robots.txt"
        execute :chmod, "644 #{release_path}/web/robots.txt"
      else
        puts "Create robots.txt file for staging environment".colorize(:light_blue)

        io = StringIO.new("User-agent: *
Disallow: /
")
        upload! io, File.join(release_path, "robots.txt")
        execute :chmod, "644 #{release_path}/robots.txt"
        execute :mv, "#{release_path}/robots.txt", "#{release_path}/web/robots.txt"
      end

      # Create files for symlinks
      fetch(:linked_files).each do |file|
        if test "[ ! -d \"#{shared_path}/#{file}\" ]"
          puts "Move #{file} file".colorize(:light_blue)

          execute :mv, "#{release_path}/#{file}.dist", "#{shared_path}/#{file}"
          execute :chmod, "644 #{shared_path}/#{file}"
        end
      end

    end
  end

end
