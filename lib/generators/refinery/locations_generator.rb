module Refinery
  class LocationsGenerator < Rails::Generators::Base

    def rake_db
      rake("refinery_locations:install:migrations")
    end

    def generate_locations_initializer
      template "config/initializers/refinery/locations.rb.erb", File.join(destination_root, "config", "initializers", "refinery", "locations.rb")
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

# Added by Refinery CMS Locations extension
Refinery::Locations::Engine.load_seed
        EOH
      end
    end
  end
end
