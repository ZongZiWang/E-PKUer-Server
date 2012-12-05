require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  setup do
    @restaurant = restaurants(:one)
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
      post :create, restaurant: { average_cost: @restaurant.average_cost, category: @restaurant.category, description: @restaurant.description, dishes: @restaurant.dishes, evaluation_environment: @restaurant.evaluation_environment, evaluation_service: @restaurant.evaluation_service, evaluation_taste: @restaurant.evaluation_taste, info_summary: @restaurant.info_summary, info_tel: @restaurant.info_tel, info_time: @restaurant.info_time, location_latitude: @restaurant.location_latitude, location_longitude: @restaurant.location_longitude, location_name: @restaurant.location_name, location_zone: @restaurant.location_zone, name: @restaurant.name, recommendations: @restaurant.recommendations }
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
    put :update, id: @restaurant, restaurant: { average_cost: @restaurant.average_cost, category: @restaurant.category, description: @restaurant.description, dishes: @restaurant.dishes, evaluation_environment: @restaurant.evaluation_environment, evaluation_service: @restaurant.evaluation_service, evaluation_taste: @restaurant.evaluation_taste, info_summary: @restaurant.info_summary, info_tel: @restaurant.info_tel, info_time: @restaurant.info_time, location_latitude: @restaurant.location_latitude, location_longitude: @restaurant.location_longitude, location_name: @restaurant.location_name, location_zone: @restaurant.location_zone, name: @restaurant.name, recommendations: @restaurant.recommendations }
    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete :destroy, id: @restaurant
    end

    assert_redirected_to restaurants_path
  end
end
