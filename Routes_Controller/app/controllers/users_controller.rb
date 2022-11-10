class UsersController < ApplicationController


    def index
        users = User.all
        render json: users
        # render plain: "I'm in the index action!"
        # render json: params

    end

    def create
        # render json: params
        # user = User.new(params.require(:user).permit(:name, :email))
        # # replace the `user_attributes_here` with the actual attribute keys
        # user.save!
        # render json: user
        user = User.new(params.require(:user).permit(:name, :email))
        if user.save
          render json: user
        else
          render json: user.errors.full_messages, status: :unprocessable_entity
        end
      

      
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def update
        user = User.find_by(params[:id])
        if user.update(params.require(:user).permit(:name, :email))
            redirect_to user_url(user.id)
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end



end
