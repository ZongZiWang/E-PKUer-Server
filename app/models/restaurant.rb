class Restaurant < ActiveRecord::Base
  attr_accessible :average_cost, :category, :description, :dishes, :evaluation_environment, :evaluation_service, :evaluation_taste, :info_summary, :info_tel, :info_time, :location_latitude, :location_longitude, :location_name, :location_zone, :name, :recommendations
end
