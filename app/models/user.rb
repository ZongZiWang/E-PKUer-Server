require 'digest/sha2'

class User < ActiveRecord::Base
	after_destroy :ensure_an_admin_remains
	attr_accessible :name, :password, :password_confirmation
	validates :name, :presence => true, :uniqueness => true
	has_many :restaurant_comments, :dependent => :destroy
	has_many :dish_comments, :dependent => :destroy
	validates :password, :confirmation => true	
	attr_accessor :password_confirmation
  	attr_reader   :password

	validate  :password_must_be_present

	def recommendation_restaurants
		restaurants = Restaurant.all
		restaurants.sort! do |a, b|
			_evaluation_a = 0
			_comments_a = a.restaurant_comments.where( user_id: id)
			_comments_a.each { |comment| _evaluation_a += comment.evaluation }
			if _comments_a.count > 0 then _evaluation_a /= _comments_a.count end
			_evaluation_b = 0
			_comments_b = b.restaurant_comments.where( user_id: id)
			_comments_b.each { |comment| _evaluation_b += comment.evaluation }
			if _comments_b.count > 0 then _evaluation_b /= _comments_b.count end
			_evaluation_b <=> _evaluation_a
		end
		restaurants.delete_if { |restaurant| restaurant.restaurant_comments.where( user_id: id).count == 0 }
	end

	def User.authenticate(name, password)
		if user = find_by_name(name)
			if user.hashed_password == encrypt_password(password, user.salt)
				user
			end 
		end
	end

	def User.encrypt_password(password, salt)
		Digest::SHA2.hexdigest(password + "zongzi" + salt)
	end

	def password=(password)
	   	@password = password

  		if password.present?
			generate_salt
			self.hashed_password = self.class.encrypt_password(password, salt)
		end
	end

	private
	
	def password_must_be_present
		errors.add(:password, "Missing password") unless hashed_password.present?
	end

	def generate_salt
		self.salt = self.object_id.to_s + rand.to_s
	end

	def ensure_an_admin_remains
		if User.count.zero?
		    raise "Can't delete last user"
		end
	end
end
