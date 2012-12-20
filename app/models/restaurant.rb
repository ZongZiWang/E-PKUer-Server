class Restaurant < ActiveRecord::Base
  attr_accessible :average_cost, :busy, :category, :description, :dishes, :evaluation, :evaluation_environment, :evaluation_service, :evaluation_taste, :image_url, :info_summary, :info_tel, :info_time, :location_latitude, :location_longitude, :location_name, :location_zone, :name, :recommendations
  validates :name, :image_url, :busy, :recommendations, :evaluation, :presence => true
  validates :average_cost, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :name, :uniqueness => true
  validates :image_url, :format => {
	  :with => %r{\.(gif|jpg|png)$}i,
	  :message => 'must be a URL for GIF, JPG or PNG image.'
  }
end
