module UnderarmourApi
  module Resource
    class UserRole < Resources::Base
      attr_reader :user_num

      def after_init(args={})
        @user_num = args[:user_num]
      end

      def endpoint
        "user_role/#{user_num}"
      end
    end
  end
end

