class Collaboration < ActiveRecord::Base
	belongs_to :user
	belongs_to :checklist
end
