class SessionsController < ApplicationController
    def score
        byebug
        user_id = User.all.find_by(name: params['id']).id
        session = Session.find_by(user_id: user_id, game_id: session_params['game_id'])
        session.update(session_params['score'])
        render json: session
    end

    private

    def session_params
        params.require('session').permit('game_id', 'score')
    end
    
    # def user_name
    #     params.require('user')
    # end
end
