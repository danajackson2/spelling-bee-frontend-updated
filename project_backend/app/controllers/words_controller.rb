class WordsController < ApplicationController

    def show
        words = Word.all.select{|word|word.difficulty == (word_params['difficulty'].to_i)}
        unusedWords = words.select{|word| !word_params['usedWords'].include?(word)}
        render json: unusedWords.sample
    end

    private

    def word_params
        params.require(:data).permit(:difficulty, usedWords: [])
    end
end
