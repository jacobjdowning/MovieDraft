task :loadMovies => :environment do
	desc "loads 6 movies into the database for testing"
	Movie.create(:title => "Oblivion", :releaseDate =>"4/19/2013", :link => "http://boxofficemojo.com/movies/?id=oblivion.htm")
	Movie.create(:title => "Iron Man 3", :releaseDate =>"5/3/2013", :link => "http://boxofficemojo.com/movies/?id=ironman3.htm")
	Movie.create(:title => "The Great Gatsby", :releaseDate =>"5/10/2013", :link => "http://boxofficemojo.com/movies/?id=greatgatsby2012.htm")
	Movie.create(:title => "Star Trek Into Darkness", :releaseDate =>"5/17/2013", :link => "http://boxofficemojo.com/movies/?id=startrek12.htm")
	Movie.create(:title => "Epic", :releaseDate =>"5/24/2013", :link => "http://boxofficemojo.com/movies/?id=leafmen.htm")
	Movie.create(:title => "Fast & Furious 6", :releaseDate =>"5/24/2013", :link => "http://boxofficemojo.com/movies/?id=fast6.htm")
end