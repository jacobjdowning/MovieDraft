class Availability < ActiveRecord::Base
  attr_accessible :league_id, :movie_id
  belongs_to :league
  belongs_to :movie
end
