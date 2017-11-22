module UnderarmourApi
  class Base
    # wrappers for resources
    attr_reader :client_id, :options, :token

    def initialize(client, options={})
      @client_id = client.config.client_id
      @token = client.config.access_token || UnderarmourApi::Authorization.new(client).fetch_access_token
      @options = options
    end

    def self.find(client, id, type)
      # another way to not have to pass client around?
      response = UnderarmourApi::Resources::Base.new(client, endpoint: "#{type}/#{id}").request(:get)
      klass = UnderarmourApi::Resources.const_get type.capitalize
      klass.new client, response
    end
  end
end
