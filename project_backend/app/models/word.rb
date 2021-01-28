require 'rest-client'
require 'json'

class Word < ApplicationRecord

    def getAudio
        response = RestClient.get("https://api.wordnik.com/v4/word.json/#{self.name}/audio?useCanonical=false&limit=50&api_key=cu7u7wkgtpw6qy1dk3dntx8j5mg44xqx87painf5jh5k8blrm")
        audio_json = JSON.parse(response.body)
        audio_json[0]["fileUrl"]
    end

    def getDefinition
        response = RestClient.get("https://api.wordnik.com/v4/word.json/#{self.name}/definitions?limit=200&includeRelated=false&sourceDictionaries=all&useCanonical=false&includeTags=false&api_key=cu7u7wkgtpw6qy1dk3dntx8j5mg44xqx87painf5jh5k8blrm")
        def_json = JSON.parse(response.body)
        def_json[0]["text"]
    end
end
