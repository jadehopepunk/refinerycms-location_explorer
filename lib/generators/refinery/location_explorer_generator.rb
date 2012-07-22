module Refinery
  class LocationExplorerGenerator < Rails::Generators::Base

    def rake_db
      rake("refinery_location_explorer:install:migrations")
    end

    def generate_locations_initializer
      template "config/initializers/refinery/location_explorer.rb.erb", File.join(destination_root, "config", "initializers", "refinery", "location_explorer.rb")
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

# Added by Refinery CMS Location Explorer extension
Refinery::LocationExplorer::Engine.load_seed
        EOH
      end
    end
  end
end
