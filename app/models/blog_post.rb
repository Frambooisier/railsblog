        class BlogPost < ApplicationRecord

          validates :title, presence: true
          validates :body, presence: true
end

        # 'status' string field
        # - draft
        # - published
        # - scheduled

        'published_at' datetime field
        - nil
        - 1.year.ago
        - 1.year.from_now