require 'test_helper'

class DishTest < ActiveSupport::TestCase
	test "dish attributes must not be empty" do
		dish = Dish.new
		assert dish.invalid?
		assert dish.errors[:name].any?
		assert dish.errors[:image_url].any?
		assert dish.errors[:evaluation].any?
		assert dish.errors[:restaurant_id].any?
	end
end
