module UnderarmourApi
  class Workout < Base




    def self.find(client, id)
      super(client, id, 'workout')
    end

    def self.me(client)
      UnderarmourApi::Base.find(client, 'self', 'workout')
    end

    def self.filter(client, user_id, query)
      # define possible filters
      UnderarmourApi::Base.filter(client, {user: user_id}.merge(query), 'workout', ['_embedded', 'workouts'])
    end
  end
end
