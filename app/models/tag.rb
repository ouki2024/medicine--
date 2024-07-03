class Tag < ApplicationRecord
    
    has_many   :tag_relationships, dependent: :destroy
    has_many   :reviews, through: :tag_relationships, dependent: :destroy
    validates :name, uniqueness: true
    
    
    
end
