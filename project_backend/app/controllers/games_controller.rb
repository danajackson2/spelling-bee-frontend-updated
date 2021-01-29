class GamesController < ApplicationController

    def create
        game = Game.create
        user1 = User.find_by(name:params["user1"])
        user2 = User.find_by(name:params["user2"])
        s1 = Session.create(game_id:game.id, user_id: user1.id)
        s2 = Session.create(game_id:game.id, user_id: user2.id)
        render json: [game, s1, s2]
    end

    def index
        render json: Game.all
    end

    def update
        Game.find(params[:id]).update(winner: game_params["winner"])
        render json: Game.find(params[:id])
    end

    private

    def game_params
        params.require('game').permit('winner')
    end
end
