class UsersController < ApplicationController
    def create
        render json: User.create(user_params)
    end

    def login
        user = User.all.find_by(name: params["username"])
        if user != nil
            render json: user
        else
            render json: {message: "User does not exist."}
        end
    end

    def destroy
        User.find(params[:id]).destroy
    end

    private

    def user_params
        params.require(:user).permit(:name)
    end
end
