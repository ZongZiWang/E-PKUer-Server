class Restaurant < ActiveRecord::Base
  attr_accessible :average_cost, :status_busy, :status_normal, :status_loose, :category, :description, :dishes, :evaluation, :image_url, :info_summary, :info_tel, :info_time, :location_latitude, :location_longitude, :location_name, :location_zone, :name
  has_many :dishes, :dependent => :destroy
  has_many :restaurant_comments, :dependent => :destroy
  has_many :complaints, :dependent => :destroy
  before_destroy :ensure_not_referenced_by_any_dish_or_comment_or_complaint
  validates :name, :image_url, :evaluation, :presence => true
  validates :average_cost, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :name, :uniqueness => true
  validates :image_url, :format => {
	  :with => %r{\.(gif|jpg|png)$}i,
	  :message => 'must be a URL for GIF, JPG or PNG image.'
  }

  def evaluation
	  if self.restaurant_comments.count == 0 then return 0 end
	  _evaluation = 0
	  self.restaurant_comments.each { |comment| _evaluation += comment.evaluation }
	  return _evaluation / self.restaurant_comments.count
  end

  def average_cost
	  if self.restaurant_comments.count == 0 then return 0 end
	  _average_cost = 0
	  self.restaurant_comments.each { |comment| _average_cost += comment.cost }
	  return _average_cost / self.restaurant_comments.count
  end

  def busy
	if self.status_normal >= self.status_busy && self.status_normal >= self.status_loose
		return 1
	else
		if self.status_loose >= self.status_busy
			return 2
		else
			return 0
		end
	end
  end
  
  def recommendations
	_recommendations = self.dishes.sort { |dish1, dish2| dish2.recommendation_count <=> dish1.recommendation_count }
#	_recommendations.delete_if { |dish| dish.recommendation_count == 0 }
  end

  def partial_recommendations
	_dishes = self.dishes.sort { |dish1, dish2| dish2.recommendation_count <=> dish1.recommendation_count }
#	_dishes.delete_if { |dish| dish.recommendation_count == 0 }
	_partial_recommendations = Array.new
	_dishes.first(3).each do |dish|
		_partial_recommendations.push({ id: dish.id, name: dish.name, recommendation_count: dish.recommendation_count })
	end
	_partial_recommendations
  end

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
  def ensure_not_referenced_by_any_dish_or_comment_or_complaint
	  if dishes.empty? && restaurant_comments.empty? && complaints.empty?
		  return true
	  else
		  errors.add(:base, 'Dishes, Comments or Complaints present')
		  return false
	  end
  end
end
