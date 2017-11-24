module UnderarmourApi
  module Resources
    class User < Resources::Base
      attr_reader :attrs

      def after_init(args)
        @attrs = args[:response]
        attrs.keys.each do |attr|
          self.class.send(:define_method, attr) { attrs[attr] }
        end
      end

      def update(params)
      end

      def profile_photo(size)
        UnderarmourApi::Resources::ProfilePhoto.new(client, id: id, size: size).image
      end

      def profile_photos
        UnderarmourApi::Resources::ProfilePhoto.new(client, id: id).all
      end

      def workout(workout_id)
        UnderarmourApi::Workout.find(client, workout_id)
      end

      def workouts(query={})
        UnderarmourApi::Workout.filter(client, id, query)
      end

      def stats(period)
        UnderarmourApi::Resources::UserStats.new(client, user_id: id, aggregate_by_period: period).aggregate
      end
    end
  end
end
