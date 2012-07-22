module Refinery
  module LocationExplorer
    class Location < Refinery::Core::BaseModel
      self.table_name = 'refinery_locations'

      attr_accessible :name, :description, :latitude, :longitude, :position, :owner, :colour_override

      acts_as_indexed :fields => [:name, :description]

      belongs_to :owner, :polymorphic => true
      has_many_page_images

      delegate :colour, :name, :description, :to => :owner, :allow_nil => true, :prefix => :owner

      def description_preview
        if description
          matches = description.match(/<p>(.*)<\/p>/)
          text = matches ? matches[1] : description
          text.truncate(200)
        end
      end

      def latlng
        [latitude, longitude] if latitude && longitude
      end

      def preview_image_url
        image = images.first
        image.thumbnail("253x160#c").url if image
      end

      def colour
        colour_override
      end

      def detail_url
        "/locations/#{to_param}"
      end
    end
  end
end
