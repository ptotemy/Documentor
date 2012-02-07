class TeamsTestsController < ApplicationController
  # GET /teams_tests
  # GET /teams_tests.json
  def index
    @teams_tests = TeamsTest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teams_tests }
    end
  end

  # GET /teams_tests/1
  # GET /teams_tests/1.json
  def show
    @teams_test = TeamsTest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teams_test }
    end
  end

  # GET /teams_tests/new
  # GET /teams_tests/new.json
  def new
    @teams_test = TeamsTest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teams_test }
    end
  end

  # GET /teams_tests/1/edit
  def edit
    @teams_test = TeamsTest.find(params[:id])
  end

  # POST /teams_tests
  # POST /teams_tests.json
  def create
    @teams_test = TeamsTest.new(params[:teams_test])

    respond_to do |format|
      if @teams_test.save
        format.html { redirect_to @teams_test, notice: 'Teams test was successfully created.' }
        format.json { render json: @teams_test, status: :created, location: @teams_test }
      else
        format.html { render action: "new" }
        format.json { render json: @teams_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teams_tests/1
  # PUT /teams_tests/1.json
  def update
    @teams_test = TeamsTest.find(params[:id])

    respond_to do |format|
      if @teams_test.update_attributes(params[:teams_test])
        format.html { redirect_to @teams_test, notice: 'Teams test was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @teams_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams_tests/1
  # DELETE /teams_tests/1.json
  def destroy
    @teams_test = TeamsTest.find(params[:id])
    @teams_test.destroy

    respond_to do |format|
      format.html { redirect_to teams_tests_url }
      format.json { head :ok }
    end
  end
end
