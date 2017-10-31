module UnderarmourApi
  module Resource
    class ProfilePhoto < Base
      attr_reader :user_num

      def all
        response = request(:get)
        parse_response(response)
      end

      def small_image(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)
      end

      def medium_image(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)
      end

      def large_image(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)
      end

      def endpoint
        "user_profile_photo/#{user_num}"
      end
    end
  end
end

