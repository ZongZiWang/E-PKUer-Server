require 'digest/sha2'

class User < ActiveRecord::Base
	attr_accessible :name, :password, :password_confirmation
	validates :name, :presence => true, :uniqueness => true
	has_many :restaurant_comments, :dependent => :destroy
	has_many :dish_comments, :dependent => :destroy
	validates :password, :confirmation => true	
	attr_accessor :password_confirmation
  	attr_reader   :password

	validate  :password_must_be_present

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
end
