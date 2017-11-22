module UnderarmourApi
  module Resources
    class User < Resources::Base

      PUBLIC_ATTRS = %w(date_joined first_name gender last_initial last_login location locality region country time_zone username preferred_language hobbies)

      PRIVATE_ATTRS = %w(birthdate email communication newsletter promotions system_messages display_measurement_system last_name location address sharing height weight id introduction goal_statement profile_statement)

      # LINKS = %w(stats privacy image documentation user_achievements friendships workouts)

      ASSOCIATED_CLASSES = %w(stats privacy profile_photo documentation user_achievements friendships workouts)

      ALL_ATTRS = [PUBLIC_ATTRS, PRIVATE_ATTRS].flatten

      def initialize(args={})
        ALL_ATTRS.each { |attr| instance_variable_set("@#{attr}", args[attr]) }
      end

      ALL_ATTRS.each do |val|
        define_method(val) do
          instance_variable_get "@#{val}"
        end
      end

      def update(params)
      end
    end
  end
end
