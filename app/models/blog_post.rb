        class BlogPost < ApplicationRecord

          validates :title, presence: true
          validates :body, presence: true
          scope :draft
end

        # 'status' string field
        # - draft
        # - published
        # - scheduled

        BlogPost.draft -> {where}
        'published_at' datetime field
        - nil
        - 1.year.ago
        - 1.year.from_nowww