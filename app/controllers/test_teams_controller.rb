class TestTeamsController < ApplicationController
  # GET /test_teams
  # GET /test_teams.json
  def index
    @test_teams = TestTeam.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @test_teams }
    end
  end

  # GET /test_teams/1
  # GET /test_teams/1.json
  def show
    @test_team = TestTeam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @test_team }
    end
  end

  # GET /test_teams/new
  # GET /test_teams/new.json
  def new
    @test_team = TestTeam.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @test_team }
    end
  end

  # GET /test_teams/1/edit
  def edit
    @test_team = TestTeam.find(params[:id])
  end

  # POST /test_teams
  # POST /test_teams.json
  def create
    @test_team = TestTeam.new(params[:test_team])

    respond_to do |format|
      if @test_team.save
        format.html { redirect_to @test_team, notice: 'Test team was successfully created.' }
        format.json { render json: @test_team, status: :created, location: @test_team }
      else
        format.html { render action: "new" }
        format.json { render json: @test_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /test_teams/1
  # PUT /test_teams/1.json
  def update
    @test_team = TestTeam.find(params[:id])

    respond_to do |format|
      if @test_team.update_attributes(params[:test_team])
        format.html { redirect_to @test_team, notice: 'Test team was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @test_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_teams/1
  # DELETE /test_teams/1.json
  def destroy
    @test_team = TestTeam.find(params[:id])
    @test_team.destroy

    respond_to do |format|
      format.html { redirect_to test_teams_url }
      format.json { head :ok }
    end
  end
end
