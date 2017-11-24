module UnderarmourApi
  class Base
    # wrappers for resources
    attr_reader :client_id, :options, :token

    def self.find(client, id, type)
      # another way to not have to pass client around?
      response = UnderarmourApi::Resources::Base.new(client, endpoint: "#{type}/#{id}").request(:get)
      klass = UnderarmourApi::Resources.const_get type.capitalize
      klass.new client, response: response
    end

    def self.filter(client, query={}, type, keys)
      # another way to not have to pass client around?
      query_string = query.map { |param, q| "#{param}=#{q}&" }.join
      UnderarmourApi::Resources::Base.new(client, endpoint: "#{type}/?#{query_string}").request(:get).dig(*keys)
    end
  end
end
