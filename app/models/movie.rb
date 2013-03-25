class Movie < ActiveRecord::Base
  attr_accessible :link, :releaseDate, :score, :title
end
