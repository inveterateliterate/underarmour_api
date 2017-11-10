module UnderarmourApi
  module Resources
    class ProfilePhoto < Resources::Base
      attr_reader :user_num

      def after_init(args={})
        @user_num = args[:user_num]
      end

      def all
        # can be more than one of each size?
        response = request(:get)
        parsed_response(response)
      end

      def small_image
        response = request(:get)
        parsed_response(response).dig('_links', 'small', 0, 'href')
      end

      def medium_image
        response = request(:get)
        parsed_response(response).dig('_links', 'medium', 0, 'href')
      end

      def large_image
        response = request(:get)
        parsed_response(response).dig('_links', 'large', 0, 'href')
      end

      def endpoint
        "user_profile_photo/#{user_num}"
      end
    end
  end
end

