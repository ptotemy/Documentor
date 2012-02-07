require 'test_helper'

class TeamsTestsControllerTest < ActionController::TestCase
  setup do
    @teams_test = teams_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teams_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teams_test" do
    assert_difference('TeamsTest.count') do
      post :create, teams_test: @teams_test.attributes
    end

    assert_redirected_to teams_test_path(assigns(:teams_test))
  end

  test "should show teams_test" do
    get :show, id: @teams_test.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teams_test.to_param
    assert_response :success
  end

  test "should update teams_test" do
    put :update, id: @teams_test.to_param, teams_test: @teams_test.attributes
    assert_redirected_to teams_test_path(assigns(:teams_test))
  end

  test "should destroy teams_test" do
    assert_difference('TeamsTest.count', -1) do
      delete :destroy, id: @teams_test.to_param
    end

    assert_redirected_to teams_tests_path
  end
end
