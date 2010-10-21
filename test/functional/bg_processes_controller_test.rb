require 'test_helper'

class BgProcessesControllerTest < ActionController::TestCase
  setup do
    @bg_process = bg_processes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bg_processes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bg_process" do
    assert_difference('BgProcess.count') do
      post :create, :bg_process => @bg_process.attributes
    end

    assert_redirected_to bg_process_path(assigns(:bg_process))
  end

  test "should show bg_process" do
    get :show, :id => @bg_process.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bg_process.to_param
    assert_response :success
  end

  test "should update bg_process" do
    put :update, :id => @bg_process.to_param, :bg_process => @bg_process.attributes
    assert_redirected_to bg_process_path(assigns(:bg_process))
  end

  test "should destroy bg_process" do
    assert_difference('BgProcess.count', -1) do
      delete :destroy, :id => @bg_process.to_param
    end

    assert_redirected_to bg_processes_path
  end
end
