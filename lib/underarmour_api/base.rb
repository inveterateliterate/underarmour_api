module UnderarmourApi
  class Base

    def self.find(client, id, type)
      response = UnderarmourApi::Resources::Base.new(client, endpoint: "#{type}/#{id}").request(:get)
      klass = UnderarmourApi::Resources.const_get type.capitalize
      klass.new client, response: response
    end

    def self.filter(client, query={}, type, keys)
      query_string = query.map { |param, q| "#{param}=#{q}&" }.join
      UnderarmourApi::Resources::Base.new(client, endpoint: "#{type}/?#{query_string}").request(:get).dig(*keys)
    end
  end
end
