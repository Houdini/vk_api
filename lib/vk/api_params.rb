module Vk
  module ApiParams
    AVAILABLE_FIELDS = %w(uid first_name last_name nickname screen_name sex bdate city country timezone photo photo_medium photo_big has_mobile rate contacts education online counters)
    GROUP_FIELDS = %w(city country place description wiki_page)

    def all_fields
      AVAILABLE_FIELDS
    end

    def all_group_fields
      GROUP_FIELDS
    end
  end
end
