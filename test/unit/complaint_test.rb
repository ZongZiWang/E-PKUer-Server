require 'test_helper'

class ComplaintTest < ActiveSupport::TestCase
	test "Complaint attributes must not be empty" do
		complaint = Complaint.new
		assert complaint.invalid?
		assert complaint.errors[:restaurant_id].any?
		assert complaint.errors[:user_id].any?
		assert complaint.errors[:content].any?
	end
end
