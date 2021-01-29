class User < ApplicationRecord
    has_many :sessions, dependent: :delete_all
    has_many :games, through: :sessions
    validates_uniqueness_of :name
    validates_presence_of :name
end