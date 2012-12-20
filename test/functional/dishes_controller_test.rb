require 'test_helper'

class DishesControllerTest < ActionController::TestCase
  setup do
    @dish = dishes(:one)
	@update = {
		:name => 'Rice dumplings',
		:image_url => 'http://i2.dpfile.com/2011-07-08/8599217_b.jpg',
		:evaluation => 8,
		:cost => 6.0,
		:category => 'Rice',
		:description => 'Good food'
	}
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dishes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dish" do
    assert_difference('Dish.count') do
      post :create, :dish => @update 
    end

    assert_redirected_to dish_path(assigns(:dish))
  end

  test "should show dish" do
    get :show, id: @dish
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dish
    assert_response :success
  end

  test "should update dish" do
    put :update, :id => @dish.to_param, :dish => @update
    assert_redirected_to dish_path(assigns(:dish))
  end

  test "should destroy dish" do
    assert_difference('Dish.count', -1) do
      delete :destroy, id: @dish
    end

    assert_redirected_to dishes_path
  end
end
