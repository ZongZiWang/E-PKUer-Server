require 'test_helper'

class DishCommentTest < ActiveSupport::TestCase
	test "Dish Comment attributes must not be empty" do
		dish_comment = DishComment.new
		assert dish_comment.invalid?
		assert dish_comment.errors[:dish_id].any?
		assert dish_comment.errors[:user_id].any?
		assert dish_comment.errors[:user_name].any?
		assert dish_comment.errors[:content].any?
	end
end
