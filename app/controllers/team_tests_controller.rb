class TeamTestsController < ApplicationController
  # GET /team_tests
  # GET /team_tests.json
  def index
    @team_tests = TeamTest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @team_tests }
    end
  end

  # GET /team_tests/1
  # GET /team_tests/1.json
  def show
    @team_test = TeamTest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team_test }
    end
  end

  # GET /team_tests/new
  # GET /team_tests/new.json
  def new
    @team_test = TeamTest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team_test }
    end
  end

  # GET /team_tests/1/edit
  def edit
    @team_test = TeamTest.find(params[:id])
  end

  # POST /team_tests
  # POST /team_tests.json
  def create
    @team_test = TeamTest.new(params[:team_test])

    respond_to do |format|
      if @team_test.save
        format.html { redirect_to user_management_path(:dept_id=>Team.find(@team_test.team_id).department_id), notice: 'Team test was successfully created.' }
        format.json { render json: @team_test, status: :created, location: @team_test }
      else
        format.html { render action: "new" }
        format.json { render json: @team_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /team_tests/1
  # PUT /team_tests/1.json
  def update
    @team_test = TeamTest.find(params[:id])

    respond_to do |format|
      if @team_test.update_attributes(params[:team_test])
        format.html { redirect_to @team_test, notice: 'Team test was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @team_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_tests/1
  # DELETE /team_tests/1.json
  def destroy
    @team_test = TeamTest.find(params[:id])
    @team_test.destroy

    respond_to do |format|
      format.html { redirect_to team_tests_url }
      format.json { head :ok }
    end
  end
end
