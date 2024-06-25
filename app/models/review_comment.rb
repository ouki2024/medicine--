class ReviewComment < ApplicationRecord
  belongs_to :user
  belongs_to :review
  
  validates :comment, presence: true, length: { minimum: 5, maximum: 200}
  
  
end
