require 'test_helper'

class TeamTestsControllerTest < ActionController::TestCase
  setup do
    @team_test = team_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:team_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create team_test" do
    assert_difference('TeamTest.count') do
      post :create, team_test: @team_test.attributes
    end

    assert_redirected_to team_test_path(assigns(:team_test))
  end

  test "should show team_test" do
    get :show, id: @team_test.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @team_test.to_param
    assert_response :success
  end

  test "should update team_test" do
    put :update, id: @team_test.to_param, team_test: @team_test.attributes
    assert_redirected_to team_test_path(assigns(:team_test))
  end

  test "should destroy team_test" do
    assert_difference('TeamTest.count', -1) do
      delete :destroy, id: @team_test.to_param
    end

    assert_redirected_to team_tests_path
  end
end
