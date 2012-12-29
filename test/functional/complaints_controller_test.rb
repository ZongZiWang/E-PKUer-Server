require 'test_helper'

class ComplaintsControllerTest < ActionController::TestCase
  setup do
    @complaint = complaints(:one)
  end

  test "should get index" do
    get :index, restaurant_id:@complaint.restaurant_id
    assert_response :success
    assert_not_nil assigns(:complaints)
  end

  test "should get new" do
    get :new, restaurant_id:@complaint.restaurant_id
    assert_response :success
  end

  test "should create complaint" do
    assert_difference('Complaint.count') do
      post :create, restaurant_id:@complaint.restaurant_id, complaint: { content: @complaint.content, restaurant_id: @complaint.restaurant_id, user_id: @complaint.user_id }
    end

    assert_redirected_to restaurant_complaint_path(assigns(:restaurant), assigns(:complaint))
  end

  test "should show complaint" do
    get :show, restaurant_id:@complaint.restaurant_id, id: @complaint
    assert_response :success
  end

  test "should get edit" do
    get :edit, restaurant_id:@complaint.restaurant_id, id: @complaint
    assert_response :success
  end

  test "should update complaint" do
    put :update, restaurant_id:@complaint.restaurant_id, id: @complaint, complaint: { content: @complaint.content, restaurant_id: @complaint.restaurant_id, user_id: @complaint.user_id }
    assert_redirected_to restaurant_complaint_path(assigns(:restaurant), assigns(:complaint))
  end

  test "should destroy complaint" do
    assert_difference('Complaint.count', -1) do
      delete :destroy, restaurant_id:@complaint.restaurant_id, id: @complaint
    end

    assert_redirected_to restaurant_complaints_path(assigns(:restaurant))
  end
end
