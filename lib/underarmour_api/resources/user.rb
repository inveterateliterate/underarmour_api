module UnderarmourApi
  module Resources
    class User < Resources::Base
      attr_reader :user_num

      PUBLIC_ATTRS = %w(date_joined first_name gender last_initial last_login location locality region country time_zone username preferred_language)

      PRIVATE_ATTRS = %w(birthdate email communication newsletter promotions system_messages display_measurement_system last_name location address sharing facebook twitter height weight)

      def initialize(args={})
        PUBLIC_ATTRS.each do |pa|
          set_instance_variable(pa, args[pa])
        end
      end


      def after_init(args={})
        @user_num = args[:user_num]
      end

      def self.find(args={})
        @user_num = user_num || args[:user_num]
        User.new request(:get)
      end

      def endpoint
        "user/#{user_num}"
      end
    end
  end
end
