class BuddiesController < ApplicationController
  def index
  end

  def show
  	@buddies = Buddy.available_buddies(current_user.id)
  end

  def add
  	buddyId = params[:buddyId]
  	buddy = Buddy.new
  	buddy.request_id = current_user.id
  	buddy.approval_id = buddyId
  	buddy.status = Buddy::PENDING
  	buddy.save
  	
  	#TODO: return proper status on save
  end
  
  def my_buddies
  	@my_buddies = Buddy.find_my_buddies(current_user.id, true)
  end
  
  def pending
  	@my_buddies = Buddy.pending_requests(current_user.id)
  end
  
  def confirm_buddy
  	buddy = Buddy.all(:conditions => ["request_id = ? and approval_id = ?", params[:buddyId], current_user.id]).first()
  	buddy.status = params[:status]
  	!buddy.save
  	render :nothing => true
  end
end