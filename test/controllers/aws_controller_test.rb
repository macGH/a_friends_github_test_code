require 'test_helper'

class AwsControllerTest < ActionController::TestCase
  setup do
    @aw = aws(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aws)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aw" do
    assert_difference('Aw.count') do
      post :create, aw: { file: @aw.file }
    end

    assert_redirected_to aw_path(assigns(:aw))
  end

  test "should show aw" do
    get :show, id: @aw
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aw
    assert_response :success
  end

  test "should update aw" do
    patch :update, id: @aw, aw: { file: @aw.file }
    assert_redirected_to aw_path(assigns(:aw))
  end

  test "should destroy aw" do
    assert_difference('Aw.count', -1) do
      delete :destroy, id: @aw
    end

    assert_redirected_to aws_path
  end
end
