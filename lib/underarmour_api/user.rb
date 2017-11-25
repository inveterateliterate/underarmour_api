module UnderarmourApi
  class User < Base

    def self.find(client, id)
      super(client, id, 'user')
    end

    def self.me(client)
      UnderarmourApi::Base.find(client, 'self', 'user')
    end
  end
end
