class UsersController < ApplicationController
    def create
        render json: User.create(user_params)
    end

    # def index
    #     User.all
    #     render json: User.all
    # end

    def login
        user = User.all.find_by(name: params["username"])
        if user != nil
            render json: user
        else
            render json: {message: "User does not exist."}
        end
    end

    private

    def user_params
        params.require(:user).permit(:name)
    end
end
