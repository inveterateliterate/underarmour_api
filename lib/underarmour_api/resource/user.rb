module UnderarmourApi
  module Resource
    class User < Base
      attr_reader :user_num

      def all
        response = request(:get)
        parse_response(response)
      end

      def self
        @user_num = 'self/'
        response = request(:get)
        parse_response(response)
      end

      def date_joined(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)
      end

      def first_name(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)
      end

      def gender(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)
      end

      def last_initial(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)
      end

      def last_login(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)
      end

      def location(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)
      end

      def locality(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)
      end

      def region(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)
      end

      def country(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)
      end

      def time_zone(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)
      end

      def username(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)
      end

      def preferred_language(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)
      end

      def endpoint
        "user/#{user_num}"
      end
    end
  end
end

