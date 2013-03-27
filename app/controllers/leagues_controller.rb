class LeaguesController < ApplicationController
  # GET /leagues
  # GET /leagues.json
  def index
    @leagues = League.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leagues }
    end
  end

  # GET /leagues/1
  # GET /leagues/1.json
  def show
    @league = League.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @league }
    end
  end

  # GET /leagues/new
  # GET /leagues/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @league }
    end
  end


  def unlink
    logger.debug "unlink called"
    @availability = Availability.where("league_id = ? AND movie_id = ?", params[:league_id], params[:movie]).first!
    @availability.destroy
    @selector = params[:movie]

    respond_to do |format|
      format.html{redirect_to leagues_add_path}
      format.js {}
    end
  end

  #GET /leagues/1/add
  def add
    @league = League.find(params[:league_id])
    @movies = @league.movies
    @players = @league.players

    respond_to do |format|
      format.html
      format.js {}
    end
  end

  #POST /leagues/1/players
  def addPlayer
    if @player = Player.where("email = ?", params[:players]).first
      @participation = Participation.new()
      @participation.league_id = :league_id
      @participation.player_id = @player.id

      respond_to do |format|
      if @participation.save
        format.html { redirect_to @participation, notice: 'Movie was added' }
        format.js   {}
        format.json { render json: @participation, status: :created, location: @participation }
      else
        format.html { render action: "add" }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
    else
    end
  end

  #POST /leagues/1/movies
  def addMovie
    @availability = Availability.new()
    @movie = Movie.find(params[:movies])
    @availability.movie_id =  params[:movies]
    @availability.league_id = params[:league_id]


    respond_to do |format|
      if @availability.save
        format.html { redirect_to @availability, notice: 'Movie was added' }
        format.js   {}
        format.json { render json: @availability, status: :created, location: @availability }
      else
        format.html { render action: "add" }
        format.json { render json: @availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /leagues/1/edit
  def edit
    @league = League.find(params[:id])
  end

  # POST /leagues
  # POST /leagues.json
  def create
    @league = League.new(params[:league])
    @league.draft = Draft.new(params[:draft])
    @league.commish = current_player.id

    respond_to do |format|
      if @league.save && @league.draft.save
        format.html { redirect_to @league, notice: 'League was successfully created.' }
        format.json { render json: @league, status: :created, location: @league }
      else
        format.html { render action: "new" }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /leagues/1
  # PUT /leagues/1.json
  def update
    @league = League.find(params[:id])

    respond_to do |format|
      if @league.update_attributes(params[:league])
        format.html { redirect_to @league, notice: 'League was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leagues/1
  # DELETE /leagues/1.json
  def destroy
    @league = League.find(params[:id])
    @league.destroy

    respond_to do |format|
      format.html { redirect_to leagues_url }
      format.json { head :no_content }
    end
  end
end
