class Draft < ActiveRecord::Base
  attr_accessible :draftdate, :draftkind, :integer, :startingFunds, :timeLimit
end
