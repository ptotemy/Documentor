require 'test_helper'

class TestTeamsControllerTest < ActionController::TestCase
  setup do
    @test_team = test_teams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_teams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_team" do
    assert_difference('TestTeam.count') do
      post :create, test_team: @test_team.attributes
    end

    assert_redirected_to test_team_path(assigns(:test_team))
  end

  test "should show test_team" do
    get :show, id: @test_team.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_team.to_param
    assert_response :success
  end

  test "should update test_team" do
    put :update, id: @test_team.to_param, test_team: @test_team.attributes
    assert_redirected_to test_team_path(assigns(:test_team))
  end

  test "should destroy test_team" do
    assert_difference('TestTeam.count', -1) do
      delete :destroy, id: @test_team.to_param
    end

    assert_redirected_to test_teams_path
  end
end
