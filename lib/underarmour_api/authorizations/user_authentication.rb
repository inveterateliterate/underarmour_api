require 'oauth2'

module UnderarmourApi
  class UserAuthentication < Authorization
    attr_reader :host_url, :oauth_client, :client_id

    def initialize(client, args={})
      client_secret = client.config.client_secret
      @client_id = client.config.client_id
      @host_url = args[:host_url]
      @oauth_client = OAuth2::Client.new(ua_key, ua_secret, site: "https://www.mapmyfitness.com/v7.1/")
      # oauth.auth_code.authorize_url(redirect_uri: "http://lvh.me:3000/oauth2/callback")
    end

    def auth_url
      # "https://api.ua.com/v7.1/oauth2/uacf/authorize/?client_id=#{ua_key}&response_type=code&redirect_uri=http://lvh.me:3000/oauth2/callback"
    end

    def endpoint
      "oauth2/uacf/authorize/?#{parameters}"
    end

    def parameters
      "client_id=#{client_id}&response_type=code&redirect_uri=#{redirect_uri}"
    end

    def redirect_uri
      "http://#{host_url}/oauth2/callback"
      # 'http://lvh.me:3000/callback'
    end

    def url_to_post_to
      "https://www.mapmyfitness.com/auth/authorize_login/?next=/oauth2/custom_oauth2_redirect/%3Fclient_id%3Dbbpgutg9sj257hkej4skwz3pyvzjv53q%26next%3Dhttp%253A%252F%252Flvh.me%253A3000%252Fcallback"
    end

    def after_init(args)
      @code = args[:code]
      data.merge(code: code)
      # raise 'code required' if code.nil?
    end
  end
end
