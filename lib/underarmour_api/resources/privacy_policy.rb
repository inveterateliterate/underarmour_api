module UnderarmourApi
  module Resources
    class PrivacyPolicies < Resources::Base
      attr_reader :option_num

      def total_count
        response = request(:get)
        parsed_response(response)['total_count']
      end

      def description(option_num)
        @option_num = option_num
        response = request(:get)
        parsed_response(response)['description']
      end

      def endpoint
        "privacy_option/#{option_num}"
      end
    end
  end
end