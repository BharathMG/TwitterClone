class User < ActiveRecord::Base
	has_many :microposts , :dependent => :destroy
	
	has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy
	has_many :following, :through => :relationships, :source => :followed
    has_many :reverse_relationships, :foreign_key => "followed_id", :class_name => "Relationship", :dependent => :destroy
  	has_many :followers, :through => :reverse_relationships, :source => :follower
	attr_accessor :password
	attr_accessible :name, :email , :password , :password_confirmation
	validates_confirmation_of :password
	validates_presence_of :password
	validates_length_of :name, :maximum => 50
	validates_length_of :password , :within => 6..10
	validates_format_of     :email, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
    validates_uniqueness_of :email
    before_save :encrypt_password
	def has_password?(submitted_password) 
		encrypted_password == encrypt(submitted_password)
	end 
	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end
	def following?(followed) 
		relationships.find_by_followed_id(followed)
	end
	def follow!(followed) 
		relationships.create!(:followed_id => followed.id)
	end
	def unfollow!(followed) 
		relationships.find_by_followed_id(followed).destroy
	end

	def remember_me!
		self.remember_token = encrypt("#{salt}--#{id}--#{Time.now.utc}") 
		save_without_validation
	end
	def feed
		Micropost.from_users_followed_by(self) 
	end
	private
	def make_salt 
			secure_hash("#{Time.now.utc}#{password}")
	end
	def encrypt_password 
            unless password.nil?
			self.salt = make_salt 
			self.encrypted_password = encrypt(password)
		    end
		end

	def encrypt(string) 
			secure_hash("#{salt}#{string}")
	end
		
	def secure_hash(string) 
			Digest::SHA2.hexdigest(string)
	end 
	

	
end

