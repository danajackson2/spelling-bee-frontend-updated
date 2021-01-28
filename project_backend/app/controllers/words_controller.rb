class WordsController < ApplicationController

    def show
        words = Word.all.select{|word|word.difficulty == (params["id"].to_i)}
        render json: words.sample
    end

end
