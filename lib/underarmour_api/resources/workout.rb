module UnderarmourApi
  module Resources
    class Workout < Resources::Base
      attr_reader :attrs

      def after_init(args)
        # get away from having to pass client? can pass second args as something else
        @attrs = args[:response].dig('_embedded', 'workouts') || args[:response]
        attrs.keys.each do |attr|
          if attrs[attr].respond_to? :key
            attrs[attr].keys.each do |attr_key|
              self.class.send(:define_method, attr_key) { attrs[attr][attr_key] }
            end
          end
          self.class.send(:define_method, attr) { attrs[attr] }
        end
      end

      def id
        self.self.first['id']
      end
    end
  end
end
