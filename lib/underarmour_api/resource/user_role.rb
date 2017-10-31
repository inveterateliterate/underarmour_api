module UnderarmourApi
  module Resource
    class UserRole < Base
      attr_reader :user_num


      def endpoint
        "user_role/#{user_num}"
      end
    end
  end
end

