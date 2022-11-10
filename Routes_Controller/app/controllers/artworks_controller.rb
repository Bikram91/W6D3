class ArtworksController < ApplicationController
    def index
        artworks = Artwork.all
        render json: artworks
        # render plain: "I'm in the index action!"
        # render json: params

    end

    def create
        # render json: params
        # user = User.new(params.require(:user).permit(:name, :email))
        # # replace the `user_attributes_here` with the actual attribute keys
        # user.save!
        # render json: user
        artwork = Artwork.new(artwork_param)

        if artwork.save
          render json: artwork
        else
          render json: artwork.errors.full_messages, status: :unprocessable_entity
        end



    end

    def show
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def update
        artwork = Artwork.find_by(id: params[:id])
        if artwork.update(artwork_param)
            redirect_to artwork_url(artwork.id)
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork = Artwork.find_by(id: params[:id])
        artwork.destroy
        redirect_to artworks_url
    end



    private
    def artwork_param
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end

end