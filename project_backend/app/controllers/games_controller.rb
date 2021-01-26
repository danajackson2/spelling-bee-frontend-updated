class GamesController < ApplicationController

    def create
        game = Game.create
        Session.create(game_id:game.id, user_id: player 1 id)
        Session.create(game_id:game.id, user_id: player 2 id)
        render json: game
    end

    def index
        render json: Game.all
    end

    def udpate
        # add game winner to the Game record
        # game = Game.find(params[:id])
        # game.winner = user
    end

end
