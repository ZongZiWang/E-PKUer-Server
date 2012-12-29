class RestaurantComment < ActiveRecord::Base
  attr_accessible :content, :cost, :evaluation, :restaurant_id, :user_id, :recommendation_dishes
  belongs_to :restaurant
  belongs_to :user
  validates :restaurant_id, :user_id, :content, :presence => true
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
  
  def user_name
	  self.user.name
  end
  
  validates :restaurant_id, :restaurant => true
  validates :user_id, :user => true
end
