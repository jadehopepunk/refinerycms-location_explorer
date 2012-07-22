module Refinery
  module LocationExplorer
    module Admin
      class LocationsController < ::Refinery::AdminController

        crudify :'refinery/location_explorer/location',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
