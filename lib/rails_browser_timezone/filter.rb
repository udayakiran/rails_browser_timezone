# Runs the controller code in the user's time zone which is determined through the offsets passed via cookies.
module RailsBrowserTimezone  
  class Filter
  
    def self.filter(controller, &block)
      cookies = controller.send(:cookies)
      last_known_tz = cookies[:last_known_tz] ? cookies[:last_known_tz] : Time.zone_default.name
      current_time_zone = time_zone_from_utc_offset(cookies[:utc_offset_summer].to_i, cookies[:utc_offset_winter].to_i, last_known_tz)
      controller.response.set_cookie(:last_known_tz, {:path => "/", :value => current_time_zone.name})
    
      Time.use_zone(current_time_zone) do
        yield
      end
    end

    # Returns the time zone based on parsed *utc_offset_summer* and *utc_offset_winter*
    # Returns the default TimeZone if none is resolved
    def self.time_zone_from_utc_offset(utc_offset_summer, utc_offset_winter, last_known_tz)
      # ActiveSupport::TimeZone[offset] - will return the first time zone that matches the offset.
      # But, we need to get the exact time zone inorder to reflect the daylight savings.
      # So, we get the user's time zone exactly by matching the summer offset and winter offset both.
      [ActiveSupport::TimeZone[last_known_tz], ActiveSupport::TimeZone.all].flatten.compact.detect(ifnone = Time.method(:zone_default)) do |zone|
        Time.use_zone(zone.name) do
          Time.zone.parse(Setting.mid_summer_date_str).utc_offset == utc_offset_summer && Time.zone.parse(Setting.mid_winter_date_str).utc_offset == utc_offset_winter
        end
      end
    end

  end
end