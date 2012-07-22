require 'refinerycms-core'

module Refinery
  autoload :LocationsGenerator, 'generators/refinery/location_explorer_generator'

  module LocationExplorer
    require 'refinery/location_explorer/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
    require 'refinery/location_explorer/configuration'
  end
end
