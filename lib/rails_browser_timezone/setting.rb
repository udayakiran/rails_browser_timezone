module RailsBrowserTimezone  
  class Setting
   class << self
      attr_writer :baseline_year
        
      def baseline_year
        @baseline_year ||= 2011
      end
      
      def mid_summer_date_str
        "#{year}-6-21"
      end
      
      def mid_winter_date_str
        "#{year}-12-21"
      end
      
      def year
        (baseline_year.to_sym == :current) ? Time.zone.now.year : baseline_year
      end
   end
  end
end