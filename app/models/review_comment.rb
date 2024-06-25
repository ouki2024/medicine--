class ReviewComment < ApplicationRecord
  belongs_to :user
  belongs_to :review
  
  validates :content, presence: true, length: { minimum: 5, maximum: 200}
  
  
end
