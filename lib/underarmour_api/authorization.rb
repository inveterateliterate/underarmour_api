module UnderarmourApi
  class Authorization < Base
    attr_reader :client_id, :client_secret, :grant_type, :token

    module GrantTypes
      CLIENT_CREDENTIALS= 'client_credentials'
      AUTHORIZATION_CODE = 'authorization_code'
    end

    def initialize(client, grant_type=GrantTypes::CLIENT_CREDENTIALS)
      @client_id = client.config.client_id
      @client_secret = client.config.client_secret
      @grant_type = grant_type
    end

    def fetch_access_token
      response = request(:post)
      access_token = response.parsed_response['access_token']
      access_token
    end

    def endpoint
      'oauth2/uacf/access_token/'
    end

    def data
      {
        client_id: client_id,
        client_secret: client_secret,
        grant_type: grant_type,
      }
      #  code
    end

    private

    def after_init(args)
      @code = args[:code]
      data.merge(code: code)
      # raise 'code required' if code.nil?
    end
  end
end
