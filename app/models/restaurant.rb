class Restaurant < ActiveRecord::Base
  attr_accessible :average_cost, :busy, :category, :description, :dishes, :evaluation, :image_url, :info_summary, :info_tel, :info_time, :location_latitude, :location_longitude, :location_name, :location_zone, :name, :recommendations
  has_many :dishes, :dependent => :destroy
  has_many :restaurant_comments, :dependent => :destroy
  before_destroy :ensure_not_referenced_by_any_dish_or_comment
  validates :name, :image_url, :busy, :recommendations, :evaluation, :presence => true
  validates :average_cost, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :name, :uniqueness => true
  validates :image_url, :format => {
	  :with => %r{\.(gif|jpg|png)$}i,
	  :message => 'must be a URL for GIF, JPG or PNG image.'
  }
  def dishes_id  
	_dishes_id = Array.new
	self.dishes.each do |dish|
		_dishes_id.push dish.id
	end
	_dishes_id
  end
  def two_comments
	_count = self.restaurant_comments.count
	self.restaurant_comments[_count-2.._count-1];
  end

  private
  def ensure_not_referenced_by_any_dish_or_comment
	  if dishes.empty? && restaurant_comments.empty?
		  return true
	  else
		  errors.add(:base, 'Dishes or Comments present')
		  return false
	  end
  end
end
