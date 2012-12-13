class User < ActiveRecord::Base
	has_many :microposts
	attr_accessible :name, :email
	
	validates_format_of     :email, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
    validates_uniqueness_of :email
end
