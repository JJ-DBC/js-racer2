class Game < ActiveRecord::Base
  has_many :sessions
  has_many :players, through: :sessions


end
