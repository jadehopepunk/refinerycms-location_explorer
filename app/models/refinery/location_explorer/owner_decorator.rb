module Refinery
  module LocationExplorer
    class OwnerDecorator
      def self.use_owner_attribute(*keys)
        keys.each do |key|
          define_method(key) do
            owner.send(key) || @subject.send(key)
          end
        end
      end

      use_owner_attribute :name, :description, :preview_image_url, :colour, :description_preview

      def initialize(subject)
        @subject = subject
      end

      def method_missing(sym, *args, &block)
        @subject.send sym, *args, &block
      end

      def as_json(options = {})
        results = {}
        methods = [:latitude, :longitude, :name] + (options[:methods] || [])
        methods.each do |method|
          results[method.to_s] = send(method)
        end
        results.as_json
      end

      def detail_url
        "/#{owner_resource_name}/#{owner.to_param}"
      end

      private

        def owner_resource_name
          owner.class.model_name.split('::').last.underscore.pluralize
        end

        def owner
          @subject.owner
        end
    end
  end
end