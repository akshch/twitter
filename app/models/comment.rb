class Comment < ApplicationRecord
  validates :content, presence: true, length: { maximum: 200,
                                                too_long: '200 characters in comment is the maximum.', minimum: 3 }
  belongs_to :user
  belongs_to :tweet

end