class User < ActiveRecord::Base
	# Enable authlogic on this model
	has_many :checklists
	has_many :requests, :class_name => 'Buddy', :foreign_key => 'request_id'
  	has_many :approvals, :class_name => 'Buddy', :foreign_key => 'approval_id'
  	
    acts_as_authentic do |c|
        c.logged_in_timeout(20.minutes)
    end
end
