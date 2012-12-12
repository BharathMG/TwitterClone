class Post < ActiveRecord::Base
	validates_length_of :post, :maximum => 140 
end
