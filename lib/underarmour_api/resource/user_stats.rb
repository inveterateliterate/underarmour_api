module UnderarmourApi
  module Resource
    class UserStats < Base
      attr_reader :user_num

      def attr_methods
        [
          :activity_count,
          :distance,
          :duration,
          :energy,
          :avg_pace,
          :avg_speed,
          :aggregate_period,
          :time_in_heart_rate_zones
        ]
      end

      def all
        response = request(:get)
        parse_response(response)
      end

      def activity_count(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)['activity_count']
      end

      def distance(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)['distance']
      end

      def duration(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)['duration']
      end

      def energy(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)['energy']
      end

      def avg_pace(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)['avg_pace']
      end

      def avg_speed(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)['avg_speed']
      end

      def aggregate_period(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)['aggregate_period']
      end

      def time_in_heart_rate_zones(user_num)
        @user_num = user_num
        response = request(:get)
        parse_response(response)['time_in_heart_rate_zones']
      end

      def queries
        [:aggregate_by_period, :end_date, :start_date, :include_summary_stats]
      end

      def endpoint
        "user_stats/#{user_num}"
      end
    end
  end
end



