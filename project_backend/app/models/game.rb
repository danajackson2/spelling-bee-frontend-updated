class Game < ApplicationRecord
    has_many :sessions, dependent: :delete_all
    has_many :users, through: :sessions
end
