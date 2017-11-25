module UnderarmourApi
  # API wrapper
  module Resources
    class Base
      attr_reader :client, :token, :response, :endpoint

      def initialize(client, options={})
        @client = client
        @token = client.config.access_token || UnderarmourApi::Authorization.new(client).fetch_access_token
        @query = options[:query]
        @params = options[:params]
        @endpoint = options[:endpoint]
        after_init(options)
      end

      class << self
      end

      def after_init(options)
        # hook for subclasses
      end

      def request(method)
        response = HTTParty.send(method, url, payload)
        check_response_status(response)
      end

      private

      def url
        "#{base_url}#{endpoint}"
      end

      def base_url
        'https://api.ua.com/v7.1/'
      end

      def payload
        {
          body: data,
          headers: headers
        }
      end

      def data()
        {}
      end

      def headers(args={})
        {
          'content-type' => 'application/x-www-form-urlencoded',
          # 'api-key' => client.config.client_id,
          'accept' => 'application/json',
          'authorization' => "Bearer #{token}",
        }.merge(args)
      end

      def check_response_status(response)
        (200..202).include?(response.code) ? parsed_response(response) : raise_http_error(response)
      end

      def parsed_response(response)
        JSON.parse(response.body)
      end

      def raise_http_error(response)
        Error::HTTPError.raise_error(response)
      end
    end
  end
end
