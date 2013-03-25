class Draft < ActiveRecord::Base
  attr_accessible :draftdate, :draftkind, :integer, :startingFunds, :timeLimit, :league_id
  belongs_to :league
end
