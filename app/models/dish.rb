class Dish < ActiveRecord::Base
  attr_accessible :category, :cost, :description, :evaluation, :name
end
