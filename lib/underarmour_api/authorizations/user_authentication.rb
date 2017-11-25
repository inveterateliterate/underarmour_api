require 'oauth2'

module UnderarmourApi
  module Authorizations
    class UserAuthorization < Resources::Authorization
      attr_reader :host_url, :oauth_client, :redirect_uri

      def after_init(args)
        # update config access token to be this token instead of the client one
        @host_url = 'https://race-tweeter.herokuapp.com/'
        # @host_url = args[:host_url]
        binding.pry
        @oauth_client = OAuth2::Client.new(client_id, client_secret, site: 'https://www.mapmyfitness.com/v7.1/')
        # oauth.auth_code.authorize_url(redirect_uri: "http://lvh.me:3000/oauth2/callback")
      end

      def url
        'https://www.mapmyfitness.com/v7.1/' + endpoint
      end

      # URL = "https://www.mapmyfitness.com/v7.1/oauth2/authorize/?client_id=bbpgutg9sj257hkej4skwz3pyvzjv53q&response_type=code&redirect_uri=https://race-tweeter.herokuapp.com/oauth2/callback"

      def endpoint
        # "oauth2/uacf/authorize/?#{parameters}"
        "oauth2/authorize/?#{parameters}"
      end

      def parameters
        "client_id=#{client_id}&response_type=code&redirect_uri=#{redirect_uri}"
      end

      def redirect_uri
        "#{host_url}oauth2/callback"
      end

      def url_to_post_to
        "https://www.mapmyfitness.com/auth/authorize_login/?next=/oauth2/custom_oauth2_redirect/%3Fclient_id%3Dbbpgutg9sj257hkej4skwz3pyvzjv53q%26next%3Dhttp%253A%252F%252Flvh.me%253A3000%252Fcallback"
      end

      def after_response(args)
        @code = args[:code]
        data.merge(code: code)
        # raise 'code required' if code.nil?
      end
    end
  end
end
