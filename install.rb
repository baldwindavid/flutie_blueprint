##
## Copy over asset files (javascript/css/images) from the plugin directory to public/
##

require 'fileutils'

def copy_files(source_path, destination_path, directory)
  source, destination = File.join(directory, source_path), File.join(RAILS_ROOT, destination_path)
  FileUtils.mkdir_p(destination, :verbose => true) unless File.exist?(destination)
  FileUtils.cp_r(source, destination, :verbose => true)
end

directory = File.dirname(__FILE__)

# Copy the flutie stylesheets into rails_root/public/flutie
copy_files("/public/stylesheets/flutie", "/public/stylesheets/flutie", directory)

# Copy the blueprint ie/print stylesheets into rails_root/public/stylesheets
copy_files("/public/stylesheets/blueprint", "/public/stylesheets/blueprint", directory)

# Copy blueprint_grid.sass into rails_root/public/stylesheets/sass
copy_files("/public/stylesheets/sass", "/public/stylesheets/sass", directory)

# Copy the stylesheet expansion into rails_root/config/initializers
copy_files("/config/flutie_expansion.rb", "/config/initializers", directory)
