require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
	test "Restaurant attributes must not be empty" do
		restaurant = Restaurant.new
		assert restaurant.invalid?
		assert restaurant.errors[:name].any?
		assert restaurant.errors[:image_url].any?
	end
end
