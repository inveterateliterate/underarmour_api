module UnderarmourApi
  module Resource
    class UserStats < Resources::Base
      attr_reader :user_num

      def after_init(args)
        @user_num = args[:user_num]
      end

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
        parsed_response(response)
      end

      # attr_methods.each do |attr_name|
      #   define_method(attr_name) do
      #     response = request(:get)
      #     parsed_response(response)[attr_name.to_s]
      #   end
      # end

      # def activity_count
      #   response = request(:get)
      #   parsed_response(response)['activity_count']
      # end

      # def distance
      #   response = request(:get)
      #   parsed_response(response)['distance']
      # end

      # def duration
      #   response = request(:get)
      #   parsed_response(response)['duration']
      # end

      # def energy
      #   response = request(:get)
      #   parsed_response(response)['energy']
      # end

      # def avg_pace
      #   response = request(:get)
      #   parsed_response(response)['avg_pace']
      # end

      # def avg_speed
      #   response = request(:get)
      #   parsed_response(response)['avg_speed']
      # end

      # def aggregate_period
      #   response = request(:get)
      #   parsed_response(response)['aggregate_period']
      # end

      # def time_in_heart_rate_zones
      #   response = request(:get)
      #   parsed_response(response)['time_in_heart_rate_zones']
      # end

      def queries
        [:aggregate_by_period, :end_date, :start_date, :include_summary_stats]
      end

      def endpoint
        "user_stats/#{user_num}"
      end
    end
  end
end



