class RestaurantComment < ActiveRecord::Base
  attr_accessible :content, :cost, :evaluation, :restaurant_id, :time, :user_id, :user_name
  belongs_to :restaurant
  belongs_to :user
  validates :restaurant_id, :user_id, :user_name, :content, :presence => true
  validates :cost, :numericality => {:greater_than_or_equal_to => 0.01}
  
  class RestaurantValidator < ActiveModel::EachValidator
	  def validate_each(record, attribute, value)
		  record.errors.add attribute, "with id=#{value} is not defined" unless Restaurant.exists?(value)
	  end
  end
  class UserValidator < ActiveModel::EachValidator
	  def validate_each(record, attribute, value)
		  record.errors.add attribute, "with id=#{value} is not defined" unless User.exists?(value)
	  end
  end
  
  validates :restaurant_id, :restaurant => true
  validates :user_id, :user => true
end
