require "will_paginate/array"
class PagesController < ApplicationController
  def home
  	@title='home'
  		if signed_in?
  	@micropost =  Micropost.new 
  	@feed_items = current_user.feed.paginate(:page => params[:page])
  		end
  	end

  def contact
  	@title= 'contact'
  end

end
