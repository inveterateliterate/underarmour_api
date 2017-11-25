module UnderarmourApi
  module Resources
    class Authorization < Resources::Base
      attr_reader :client_id, :client_secret, :grant_type, :client

      module GrantTypes
        CLIENT_CREDENTIALS = 'client_credentials'
        AUTHORIZATION_CODE = 'authorization_code'
      end

      def initialize(client, grant_type=GrantTypes::CLIENT_CREDENTIALS, args={})
        @client = client
        @client_id = client.config.client_id
        @client_secret = client.config.client_secret
        @grant_type = grant_type
        after_init(args)
      end

      def fetch_access_token
        response = request(:post)
        access_token = response['access_token']
        access_token
      end
    end
  end
end
