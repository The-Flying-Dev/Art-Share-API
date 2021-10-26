class ChangeColumnNullforArtworks < ActiveRecord::Migration[5.1]
  def change
    change_column_null :artworks, :title, false
    change_column_null :artworks, :image_url, false
    change_column_null :artworks, :artist_id, false
  end
end
