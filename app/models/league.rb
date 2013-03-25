class League < ActiveRecord::Base
  attr_accessible :commish, :name
  has_many :availabilities
  has_many :movie, :through => :availabilities
  has_many :participations
  has_many :players, :through => :participations
end
