class CheckListController < ApplicationController
  def index
	
  end
  def create
  	@checklist = Checklist.new(params[:checklist])
  	@checklist.owner_id = current_user.id
  	if @checklist.save
  		puts 'SUCCESSFUL'
  	else
  		puts 'FAILED'
  	end
  	show
  	redirect_to :action => "show"
  end

  def delete
  end

  def update
  
  end
  
  def new
  	@checklist = Checklist.new
  end
  
  def show
  	@my_checklists = Checklist.paginate :page => params[:page], :order => 'created_at DESC', :conditions => ["owner_id = ?", current_user.id]
  end
  
  def create_invitations
  
  end
end
