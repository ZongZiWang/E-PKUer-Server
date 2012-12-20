class Dish < ActiveRecord::Base
  attr_accessible :category, :cost, :description, :evaluation, :image_url, :name
end
