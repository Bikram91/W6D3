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
        user = User.new(user_param)
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
        user = User.find_by(id: params[:id])
        if user.update(user_param)
            redirect_to user_url(user.id)
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        user.destroy
        redirect_to "/users"
    end



    private
    def user_param
        params.require(:user).permit(:name, :email)
    end



end
