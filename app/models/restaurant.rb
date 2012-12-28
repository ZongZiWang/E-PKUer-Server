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
  def partial_dishes 
	_count = self.dishes.count
	_partial_dishes = Array.new
	self.dishes.last(3).each do |dish|
		_partial_dishes.push({ id: dish.id, name: dish.name })
	end
	_partial_dishes
  end
  def partial_comments
	_count = self.restaurant_comments.count
	_partial_comments = Array.new
	self.restaurant_comments.last(2).each do |comment|
		_partial_comments.push({ id: comment.id, user_name: comment.user.name, evaluation: comment.evaluation, content: comment.content })
	end
	_partial_comments
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
