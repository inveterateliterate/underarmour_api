module UnderarmourApi
  # API wrapper
  module Resources
    class Base
      attr_reader :client_id, :token, :response

      def initialize(client, options={})
        @client_id = client.config.client_id
        @token = client.config.access_token || UnderarmourApi::Authorization.new(client).fetch_access_token
        after_init(options)
      end

      class << self
      end

      def request(method)
        response = HTTParty.send(method, url, payload)
        (200..202).include?(response.code) ? parsed_response(response) : raise_http_error(response)
      end

      private

      def url
        "#{base_url}#{endpoint}"
      end

      def base_url
        'https://api.ua.com/v7.1/'
      end

      def endpoint
        raise 'endpoint required by subclasses'
      end

      def payload
        {
          body: data,
          headers: headers
        }
      end

      def data
        {}
      end

      def headers
        {
          'content-type' => 'application/x-www-form-urlencoded',
          'api-key' => client_id,
          'accept' => 'application/json',
          'authorization' => "Bearer #{token}",
        }
      end

      def parsed_response(response)
        JSON.parse(response.body)
      end

      def after_init(args)
        # hook for subclasses
      end

      def raise_http_error(response)
        Error::HTTPError.raise_error(response)
      end
    end
  end
end
