module UnderarmourApi
  module Resources
    class UserStats < Resources::Base
      attr_reader :period

      PERIODS = %w(day week month year lifetime)

      def after_init(args)
        @period = args[:aggregate_by_period].to_s
        @endpoint = "user_stats/#{args[:user_id]}/?aggregate_by_period=#{period}"
      end

      def aggregate
        aggregate_period_error unless PERIODS.include? period
        request(:get)['_embedded']['stats']
      end

      def aggregate_period_error
        raise UnderarmourApi::Error::InvalidArgument.new(invalid_aggregate_period)
      end

      def invalid_aggregate_period
        'period argument for user stats must be one of: ' + PERIODS.join(', ')
      end
    end
  end
end
