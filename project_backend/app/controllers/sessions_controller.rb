class SessionsController < ApplicationController

    def update
        session = Session.find(params['id'])
        session.update(score: session_params['score'])
        render json: session
    end

    def index
        sessions_with_scores = Session.all.select{|s|s.score != nil}
        top5 = sessions_with_scores.sort_by{|s| s.score}.reverse[0..4]
        data = {}
        top5.each{|s| data[s.user.name] = s.score}
        render json: data
    end

    private

    def session_params
        params.require('session').permit('score')
    end
    
end