class Player < ActiveRecord::Base
  has_many :sessions
  has_many :games, through: :sessions# Remember to create a migration!
  validates :name, uniqueness: true
end
