module UnderArmourApi
  class UserAuthorization
    attr_reader :host_url

    def initialize(args={})
      @host_url = args[:host_url]
    end

    def endpoint
      "oauth2/uacf/authorize/?#{parameters}"
    end

    def parameters
      "client_id=#{config.client_id}&response_type=code&redirect_uri=#{redirect_uri}"
    end

    def redirect_uri
      "http://#{host_url}/callback"
    end
  end
end
