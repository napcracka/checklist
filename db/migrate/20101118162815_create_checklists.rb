class CreateChecklists < ActiveRecord::Migration
  def self.up
    create_table :checklists do |t|
      t.string :name, :null => false
      t.boolean :active, :default => true
      t.integer :owner_id, :null => false
      t.date :expiration_date
      t.timestamps
    end
  end

  def self.down
    drop_table :checklists
  end
end
