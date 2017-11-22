module UnderarmourApi
  class Workout < Base

    def self.find(client, id)
      super(client, id, 'workout')
    end

    def self.me(client)
      UnderarmourApi::Base.find(client, 'self', 'workout')
    end
  end
end
