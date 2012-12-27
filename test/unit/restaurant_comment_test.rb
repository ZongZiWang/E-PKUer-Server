require 'test_helper'

class RestaurantCommentTest < ActiveSupport::TestCase
	test "Restaurant Comment attributes must not be empty" do
		restaurant_comment = RestaurantComment.new
		assert restaurant_comment.invalid?
		assert restaurant_comment.errors[:restaurant_id].any?
		assert restaurant_comment.errors[:user_id].any?
		assert restaurant_comment.errors[:content].any?
	end
end
