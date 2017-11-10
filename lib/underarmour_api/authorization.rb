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
  end
end
