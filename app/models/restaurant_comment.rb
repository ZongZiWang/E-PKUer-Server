class RestaurantComment < ActiveRecord::Base
  attr_accessible :content, :cost, :evaluation, :restaurant_id, :time, :user_id, :user_name
  belongs_to :restaurant
  belongs_to :user
  validates :restaurant_id, :user_id, :user_name, :content, :presence => true
  validates :cost, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :time, :uniqueness => true
end
