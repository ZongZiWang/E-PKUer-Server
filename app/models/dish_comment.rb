class DishComment < ActiveRecord::Base
  attr_accessible :content, :dish_id, :evaluation, :user_id
  belongs_to :dish
  belongs_to :user
  validates :dish_id, :user_id, :content, :presence => true
  
  class DishValidator < ActiveModel::EachValidator
	  def validate_each(record, attribute, value)
		  record.errors.add attribute, "with id=#{value} is not defined" unless Dish.exists?(value)
	  end
  end
  class UserValidator < ActiveModel::EachValidator
	  def validate_each(record, attribute, value)
		  record.errors.add attribute, "with id=#{value} is not defined" unless User.exists?(value)
	  end
  end
  
  validates :dish_id, :dish => true
  validates :user_id, :user => true
end
