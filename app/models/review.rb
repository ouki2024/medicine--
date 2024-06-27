class Review < ApplicationRecord
    
    belongs_to :user
    has_many :review_comments, dependent: :destroy
    has_many  :tag_relationships, dependent: :destroy
        has_many  :tags, through: :tag_relationships

    
    has_one_attached :profile_image  
    
    validates :nickname, presence: true
    validates :gender, presence: true
    validates :age, presence: true
    validates :address, presence: true
    validates :hospital, presence: true
    validates :clinical_department, presence: true
    validates :pharmacy, presence: true
    validates :use_count, presence: true
    validates :visit_month, presence: true
    
    validates :content, presence: true, length: { minimum: 5, maximum: 200}
    
    def get_profile_image(width, height)
    
        unless profile_image.attached?
            file_path = Rails.root.join('app/assets/images/no_image.jpg')
            profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        
        end
            profile_image.variant(resize_to_limit: [width, height]).processed
    end
    
    # def self.search(search)
    #     if search != ""
    #         Review.where('text LIKE(?)', "%#{search}%")
    #     else
    #         Review.all
    #     end
    # end
    
end
