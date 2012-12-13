class User < ActiveRecord::Base
	has_many :microposts
	
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
	private
		def encrypt_password
			self.salt = make_salt 
			self.encrypted_password = encrypt(password)
		end
		def encrypt(string) 
			secure_hash("#{salt}#{string}")
		end
		def make_salt 
			secure_hash("#{Time.now.utc}#{password}")
		end
		def secure_hash(string) 
			Digest::SHA2.hexdigest(string)
		end 
	end
	

