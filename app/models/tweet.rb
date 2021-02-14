class Tweet < ApplicationRecord
  validates :content, presence: true, length: { maximum: 300,
  too_long: '1000 characters in post is the maximum allowed.', minimum: 3 }

 belongs_to :user, foreign_key: :user_id

end