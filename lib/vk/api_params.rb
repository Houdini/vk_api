module Vk
  module ApiParams
    AVAILABLE_FIELDS = %w(uid first_name last_name sex bdate city country photo photo_medium photo_medium_rec photo_big photo_rec online lists screen_name has_mobile rate contacts education universities schools can_post can_see_all_posts can_write_private_message activity last_seen relation counters nickname wall_comments interests movies tv books games about connections relatives timezone)
    GROUP_FIELDS = %w(city country place description wiki_page members_count counters start_date end_date)

    def all_fields
      AVAILABLE_FIELDS
    end

    def all_group_fields
      GROUP_FIELDS
    end
  end
end
