class UsersController < ApplicationController
    def create
        render json: User.create(user_params)
    end

    def index
        render json: User.all
    end

    private

    def user_params
        params.require(:user).permit(:name)
    end
end
