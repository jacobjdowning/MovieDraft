class Movie < ActiveRecord::Base
  attr_accessible :link, :releaseDate, :score, :title
  has_many :availabilities
  has_many :leagues, :through => :availabilities
  has_many :memberships
  has_many :players, :through => :memberships
end
