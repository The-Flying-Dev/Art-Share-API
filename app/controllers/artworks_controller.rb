class ArtworksController < ApllicationController
    
    def create
      artwork = Artwork.new(artwork_params)

      if artwork.save!
        render json: artwork, status: :created
      else 
        render json: artwork.errors.full_messages, status: :unprocessable_entity
      end
    end


    def destroy 
      artwork = Artwork.find(params(:id))
      artwork.destroy
	  render json: artwork
    end

    def index
      if params[:user_id]
        render json: Artwork.artworks_for_user_id(params[:user_id])
      elsif params[:collection_id]
        render json: Artwork.artworks_for_collection_id(params[:collection_id])
      end
    end


    def show  
      render json: Artwork.find(params[:id])
    end


    def update  
      artwork = Artwork.find(params[:id])

      if artwork.update(artwork_params)
        render json: artwork
      else
        render json: artwork.errors.full_messages, status: :unprocessable_entity
      end
    end



  private

   def artwork_params
     params.require(:artwork).permit(:title, :image_url, :artist_id)
   end


end