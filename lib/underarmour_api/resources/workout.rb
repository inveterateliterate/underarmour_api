module UnderarmourApi
  module Resources
    class Workout < Resources::Base
      attr_reader :response

      FLAT_ATTRS = %w(start_datetime name updated_datetime created_datetime notes reference_key start_locale_timezone source has_time_series is_verified)

      LINKS_ATTRS = %w(self route activity_type user privacy)

      AGGREGATE_ATTRS = %w(active_time_total distance_total steps_total speed_avg elapsed_time_total metabolic_energy_total)

      ALL_ATTRS = [FLAT_ATTRS, LINKS_ATTRS, AGGREGATE_ATTRS].flatten

      # need to do some nesting magic for the nested attrs for getter and setter

      def initialize(args={})
        @response = args
        set_attributes
      end

      def set_attributes
        set_flat_attrs
        set_links_attrs
        set_aggregate_attrs
      end

      def set_flat_attrs
        FLAT_ATTRS.each { |attr| instance_variable_set("@#{attr}", response[attr]) }
      end

      def set_links_attrs
        LINKS_ATTRS.each { |attr| instance_variable_set("@#{attr}_id", response.dig(attr, 0, 'id')) }
      end

      def set_aggregate_attrs
        AGGREGATE_ATTRS.each { |attr| instance_variable_set("@#{attr}", response.dig('aggregates', attr)) }
      end

      ALL_ATTRS.each do |val|
        define_method(val) do
          instance_variable_get "@#{val}"
        end
      end
    end
  end
end
