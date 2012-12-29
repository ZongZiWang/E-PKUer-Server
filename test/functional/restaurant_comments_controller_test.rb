require 'test_helper'

class RestaurantCommentsControllerTest < ActionController::TestCase
  setup do
    @restaurant_comment = restaurant_comments(:one)
	@update = {
		:restaurant_id => restaurants(:one)[:id],
		:user_id => users(:one)[:id],
		:evaluation => 4,
		:cost => 5.5,
		:content => "Good",
		:recommendation_dishes => "Food1, Dish2"
	}
  end

  test "should get index" do
    get :index, restaurant_id:@restaurant_comment.restaurant_id
    assert_response :success
    assert_not_nil assigns(:restaurant_comments)
  end

  test "should get new" do
    get :new, restaurant_id:@restaurant_comment.restaurant_id
    assert_response :success
  end

  test "should create restaurant_comment" do
    assert_difference('RestaurantComment.count') do
		post :create, restaurant_id:@restaurant_comment.restaurant_id, restaurant_comment: @update
    end

    assert_redirected_to restaurant_comment_path(assigns(:restaurant), assigns(:restaurant_comment))
  end

  test "should show restaurant_comment" do
    get :show, restaurant_id:@restaurant_comment.restaurant_id, id: @restaurant_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, restaurant_id:@restaurant_comment.restaurant_id, id: @restaurant_comment
    assert_response :success
  end

  test "should update restaurant_comment" do
    put :update, restaurant_id:@restaurant_comment.restaurant_id, id: @restaurant_comment.to_param, restaurant_comment: @update
    assert_redirected_to restaurant_comment_path(assigns(:restaurant), assigns(:restaurant_comment))
  end

  test "should destroy restaurant_comment" do
    assert_difference('RestaurantComment.count', -1) do
      delete :destroy, restaurant_id:@restaurant_comment.restaurant_id, id: @restaurant_comment
    end

    assert_redirected_to restaurant_comments_path(assigns(:restaurant))
  end
end
