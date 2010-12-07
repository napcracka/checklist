class Checklist < ActiveRecord::Base
	has_many :tasks
	has_many :items
	belongs_to :user
	accepts_nested_attributes_for :tasks, :allow_destroy => true
	accepts_nested_attributes_for :items, :allow_destroy => true
	
	cattr_reader :per_page
  	@@per_page = 10
end