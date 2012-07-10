module Vk
  module ApiParams
    AVAILABLE_FIELDS = %w(uid first_name last_name nickname screen_name sex bdate city country timezone photo photo_medium photo_big has_mobile rate contacts education online counters)
    def all_fields
      AVAILABLE_FIELDS.join(',')
    end
  end
end
