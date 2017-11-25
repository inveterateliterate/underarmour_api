module UnderarmourApi
  module Resources
    class Authorization < Resources::Base
      attr_reader :client, :code, :grant_type

      module GrantTypes
        CLIENT_CREDENTIALS = 'client_credentials'
        AUTHORIZATION_CODE = 'authorization_code'
      end

      def initialize(client, args={})
        @client = client
        @code = args[:code]
        @grant_type = code ? GrantTypes::AUTHORIZATION_CODE : GrantTypes::CLIENT_CREDENTIALS
      end

      def fetch_access_token
        response = request(:post)
        access_token = response['access_token']
        access_token
      end

      def endpoint
        'oauth2/uacf/access_token/'
      end

      def data
        {
          client_id: client.config.client_id,
          client_secret: client.config.client_secret,
          grant_type: grant_type,
        }.merge(code_data)
      end

      def code_data
        code ? { code: code } : {}
      end
    end
  end
end
