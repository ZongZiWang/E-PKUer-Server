require 'test_helper'

class DishCommentsControllerTest < ActionController::TestCase
  setup do
    @dish_comment = dish_comments(:one)
	@update = {
		:dish_id => dishes(:one)[:id],
		:user_id => users(:one)[:id],
	   	:evaluation => 4,
	   	:content => "Good"
   	}
  end

  test "should get index" do
    get :index, dish_id: @dish_comment.dish_id
    assert_response :success
    assert_not_nil assigns(:dish_comments)
  end

  test "should get new" do
    get :new, dish_id: @dish_comment.dish_id
    assert_response :success
  end

  test "should create dish_comment" do
    assert_difference('DishComment.count') do
      post :create, dish_id: @dish_comment.dish_id, dish_comment: @update 
    end

    assert_redirected_to dish_comment_path(assigns(:dish), assigns(:dish_comment))
  end

  test "should show dish_comment" do
    get :show, dish_id: @dish_comment.dish_id, id: @dish_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, dish_id: @dish_comment.dish_id, id: @dish_comment
    assert_response :success
  end

  test "should update dish_comment" do
    put :update, dish_id: @dish_comment.dish_id, id: @dish_comment, dish_comment: @update 
    assert_redirected_to dish_comment_path(assigns(:dish), assigns(:dish_comment))
  end

  test "should destroy dish_comment" do
    assert_difference('DishComment.count', -1) do
      delete :destroy, dish_id: @dish_comment.dish_id, id: @dish_comment
    end

    assert_redirected_to dish_comments_path(assigns(:dish))
  end
end
