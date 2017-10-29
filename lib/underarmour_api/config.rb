module UnderArmourApi
  # `UnderArmourApi::Config` manages the configuration options for the UnderArmour API wrapper. This is a good place to refer to your client ID and client secret. These should be referenced from your secret file as environment variables, such as ENV['UA_API_KEY'].
  class Config
    CLIENT_KEYS = [:client_id, :client_secret]
    attr_accessor *CLIENT_KEYS

    # Creates a new instance of 'UnderArmourApi::Config'
    def initialize(client_keys={})
      # error if no hash,
      return unless client_keys.is_a? Hash
      # error if hash keys named incorrectly
      return unless valid_key_names? client_keys.keys

      client_keys.each do |key, value|
        self.send("#{key}=", value)
      end
    end

    def client_keys
      CLIENT_KEYS.inject({}) do |client_keys, key|
        client_keys[key] = send(key)
        client_keys
      end
    end

    def valid_key_names?(key_names)
      key_names.reject { |key| CLIENT_KEYS.include? key }.count == 0
    end
  end
end
