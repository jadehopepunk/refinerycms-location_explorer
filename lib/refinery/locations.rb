require 'refinerycms-core'

module Refinery
  autoload :LocationsGenerator, 'generators/refinery/locations_generator'

  module Locations
    require 'refinery/locations/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
    require 'refinery/locations/configuration'
  end
end
