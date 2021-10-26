class Artwork < ApplicationRecord
    validates :title, :image_url, :artist_id, presence: true
    validates :title,  uniqueness: true
end
