class AddForeignKeysToItemsAndTasks < ActiveRecord::Migration
  def self.up
  	change_table :items do |t|
  		t.integer :checklist_id, :null => false
  		t.integer :completed_by_id
  		t.integer :assigned_to_id
  		t.string :name
  		t.text :description
  		t.boolean :active, :default => true
  		t.timestamp :completed_date
	end
	change_table :tasks do |t|
  		t.integer :checklist_id, :null => false
  		t.integer :assigned_to_id
  		t.integer :completed_by_id
  		t.string :name
  		t.decimal :percentage_complete
  		t.boolean :active, :default => true
  		t.text   :description
	end
  end

  def self.down
	change_table :items do |t|
		t.remove :checklist_id, :completed_by_id, :part_number, :active, :completed_date, :description, :assigned_to_id
	end
	
	change_table :tasks do |t|
		t.remove :checklist_id, completed_by_id, :name, :percentage_complete, :active, :description, :assigned_to_id
	end
  end
end
