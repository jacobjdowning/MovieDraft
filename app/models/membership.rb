class Membership < ActiveRecord::Base
  attr_accessible :league_id, :movie_id, :player_id
end
