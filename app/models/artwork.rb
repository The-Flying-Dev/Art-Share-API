class Artwork < ApplicationRecord
    validates :title, :artist_id, presence: true
    validates :image_url, uniqueness: true
    validates :title,  uniqueness: { scope: :artist_id }
    
    belongs_to :artist, foreign_key: :artist_id, class: 'User'

    has_many :shared_viewers, through: :artwork_shares, source: :viewer

    has_many :comments, dependent: :destroy
      
end