class DraftController < ApplicationController
	def show
		@league = League.find(params[:id])
		@draft = @league.draft
		@availableMovies = @league.movies.where("player_id IS NULL").order("releaseDate DESC")

	    respond_to do |format|
	      format.html # show.html.erb
	      format.json { render json: @league }
	    end
	end
end
