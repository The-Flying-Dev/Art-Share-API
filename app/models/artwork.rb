class Artwork < ApplicationRecord
    validates :title, :artist_id, presence: true
    validates :image_url, uniqueness: true
    validates :title,  uniqueness: { scope: :artist_id }
    
    belongs_to :artist

    has_many :shared_viewers, through: :artwork_shares, source: :viewer
      
end