module Refinery
  module LocationExplorer
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::LocationExplorer

      engine_name :refinery_location_explorer

      initializer "register refinerycms_location_explorer plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "location_explorer"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.location_explorer_admin_locations_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/location_explorer/admin/location',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::LocationExplorer)
      end
    end
  end
end
