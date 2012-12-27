require 'test_helper'

class DishCommentsControllerTest < ActionController::TestCase
  setup do
    @dish_comment = dish_comments(:one)
	@update = {
		:dish_id => dishes(:one)[:id],
		:user_id => users(:one)[:id],
	   	:evaluation => 4,
	   	:time => "2012-07-07 10:03:31",
	   	:content => "Good"
   	}
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dish_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dish_comment" do
    assert_difference('DishComment.count') do
      post :create, dish_comment: @update 
    end

    assert_redirected_to dish_comment_path(assigns(:dish_comment))
  end

  test "should show dish_comment" do
    get :show, id: @dish_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dish_comment
    assert_response :success
  end

  test "should update dish_comment" do
    put :update, id: @dish_comment, dish_comment: @update 
    assert_redirected_to dish_comment_path(assigns(:dish_comment))
  end

  test "should destroy dish_comment" do
    assert_difference('DishComment.count', -1) do
      delete :destroy, id: @dish_comment
    end

    assert_redirected_to dish_comments_path
  end
end
