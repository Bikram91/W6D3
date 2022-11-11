class CommentsController < ApplicationController
    def index
        user = User.find_by(id: params[:user_id])
        artwork = Artwork.find_by(id: params[:artwork_id])
        if user
            comments = user.comments
            render json: comments
        elsif artwork
            comments = artwork.comments
            render json: comments
        end

        # render plain: "I'm in the index action!"
        # render json: params

    end
end
