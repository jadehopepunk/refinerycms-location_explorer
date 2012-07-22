module Refinery
  module LocationExplorer
    class LocationsController < ::ApplicationController

      before_filter :find_all_locations
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @location in the line below:
        present(@page)
      end

      def show
        @location = decorate_location(Location.find(params[:id]))

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @location in the line below:
        present(@page)
      end

    protected

      def decorate_location(location)
        location.owner ? OwnerDecorator.new(location) : location
      end

      def decorate_locations(locations)
        locations.map do |location|
          decorate_location(location)
        end
      end

      def find_all_locations
        @locations = decorate_locations(Location.order('position ASC'))
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/locations").first
      end

    end
  end
end
