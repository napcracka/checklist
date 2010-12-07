class Buddy < ActiveRecord::Base
	belongs_to :request, :class_name => 'User'
  	belongs_to :approval, :class_name => 'User'
  	
  	ACTIVE		= 'ACTIVE'
  	PENDING		= 'PENDING'
  	DENIED		= 'DENIED'
  	
  	#
  	# complex relationship queries go here
  	#
  	def self.find_my_buddies(user_id, active)
  		User.find_by_sql "select u3.* from (Select b1.approval_id as identifier from buddies b1 join users u1 on (b1.approval_id = u1.id) where b1.request_id = #{user_id} and b1.status = 'ACTIVE' " + 
  			"UNION Select b2.request_id as identifier from buddies b2 join users u2 on (b2.approval_id = u2.id) where b2.approval_id = #{user_id} and b2.status = 'ACTIVE') as buddy_list " +
  			"join users u3 on (u3.id = buddy_list.identifier)"
  	end
  	
  	def self.pending_requests(user_id)
  		User.find_by_sql "select u.*, b.created_at as request_made from Buddies b join Users u on (b.request_id = u.id) where b.approval_id = #{user_id} and b.status = 'PENDING'"	 
  	end
  	
  	def self.available_buddies(user_id)
  		User.find_by_sql "Select u3.* from Users u3 where u3.id != #{user_id} and u3.id not in (Select b1.approval_id as identifier from buddies b1 join users u1 on (b1.approval_id = u1.id) where b1.request_id = #{user_id} " + 
  			"UNION Select b2.request_id as identifier from buddies b2 join users u2 on (b2.approval_id = u2.id) where b2.approval_id = #{user_id})" 
  	end
end