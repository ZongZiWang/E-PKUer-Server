require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  setup do
    @restaurant = restaurants(:one)
	@update = {
		:name => 'Nongyuan',
		:image_url => 'images/nongyuan.jpg',
		:evaluation => 3.0,
		:location_name => 'West of Buidling No.2',
		:location_zone => 'Near Classrooms',
		:location_latitude => 40.000,
		:location_longitude => 120.000,
		:info_time => '11=>30-13=>00 17=>00-19=>00',
		:info_tel => 62750000,
		:info_summary => 'Nearest of classrooms',
		:average_cost => 5.50,
		:category => 'Common',
		:description => 'Very good place',
		:status_busy => 1,
		:status_normal => 2,
		:status_loose => 3
	}
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post :create, :restaurant => @update
    end

    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should show restaurant" do
    get :show, id: @restaurant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restaurant
    assert_response :success
  end

  test "should update restaurant" do
    put :update, :id => @restaurant.to_param, :restaurant => @update
    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete :destroy, id: @restaurant
    end

    assert_redirected_to restaurants_path
  end
end
