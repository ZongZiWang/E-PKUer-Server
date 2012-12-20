class Dish < ActiveRecord::Base
  attr_accessible :category, :cost, :description, :evaluation, :image_url, :name
  validates :name, :image_url, :evaluation, :presence => true
  validates :cost, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :name, :uniqueness => true
  validates :image_url, :format => {
	  :with => %r{\.(gif|jpg|png)$}i,
	  :message => 'must be a URL for GIF, JPG or PNG image.'
  }
end
