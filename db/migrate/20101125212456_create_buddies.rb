class CreateBuddies < ActiveRecord::Migration
  def self.up
    create_table :buddies do |t|
	  t.integer :request_id, :null => false
	  t.integer :approval_id, :null => false
	  t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :buddies
  end
end
