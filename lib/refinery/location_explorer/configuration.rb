module Refinery
  module LocationExplorer
    include ActiveSupport::Configurable

    config_accessor :map_center, :map_zoom

    self.map_center = [-12.043333, -77.028333]
  end
end
