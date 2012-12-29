require 'test_helper'

class DishesControllerTest < ActionController::TestCase
  setup do
    @dish = dishes(:one)
	@update = {
		:name => 'Rice dumplings',
		:restaurant_id => restaurants(:one)[:id],
		:image_url => 'http://i2.dpfile.com/2011-07-08/8599217_b.jpg',
		:evaluation => 8,
		:cost => 6.0,
		:category => 'Rice',
		:description => 'Good food'
	}
  end

  test "should get index" do
    get :index, restaurant_id: @dish.restaurant_id
    assert_response :success
    assert_not_nil assigns(:dishes)
  end

  test "should get new" do
    get :new, restaurant_id: @dish.restaurant_id
    assert_response :success
  end

  test "should create dish" do
    assert_difference('Dish.count') do
      post :create, restaurant_id: @dish.restaurant_id, dish: @update 
    end

    assert_redirected_to restaurant_dish_path(assigns(:restaurant), assigns(:dish))
  end

  test "should show dish" do
    get :show, restaurant_id: @dish.restaurant_id, id: @dish
    assert_response :success
  end

  test "should get edit" do
    get :edit, restaurant_id: @dish.restaurant_id, id: @dish
    assert_response :success
  end

  test "should update dish" do
    put :update, restaurant_id: @dish.restaurant_id, id: @dish.to_param, dish: @update
    assert_redirected_to restaurant_dish_path(assigns(:restaurant), assigns(:dish))
  end

  test "should destroy dish" do
    assert_difference('Dish.count', -1) do
      delete :destroy, restaurant_id: @dish.restaurant_id, id: @dish
    end

    assert_redirected_to restaurant_dishes_path(assigns(:restaurant))
  end
end
