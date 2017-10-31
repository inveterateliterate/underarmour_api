module UnderarmourApi
  # API wrapper
  class Base
    attr_reader :client_id, :options, :token, :query

    def initialize(client, token=nil, options={})
      @client_id = client.config.client_id
      @token = token || Authorization.new(client).fetch_access_token
    # access token needed to authorize a user
      @options = options
      # @token = options[:token] || Authorization.new(client).fetch_access_token
      # after_init
    end

    class << self
    end

    def request(method)
      HTTParty.send(method, url, payload)
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

    # def query
    #   {}
    # end

    def parse_response(response)
      JSON.parse(response.body)
    end

    # def after_init(args)
      # hook for subclasses
    # end
  end
end
