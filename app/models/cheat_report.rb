class CheatReport < ApplicationRecord
  has_one_attached :cover_image
  has_rich_text :content
    enum :status, {
      pending: 0,
      under_review: 1,
      confirmed: 2,
      rejected: 3,
      not_enough_evidence: 4,
      suspected: 5,
      overturned: 6
    }
    scope :reported, -> { where(status: 0) }
  end
