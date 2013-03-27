class Participation < ActiveRecord::Base
  attr_accessible :league_id, :player_id
  belongs_to :league
  belongs_to :player
end
