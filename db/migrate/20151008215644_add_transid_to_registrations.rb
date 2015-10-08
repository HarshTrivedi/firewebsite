class AddTransidToRegistrations < ActiveRecord::Migration
  def up
  	add_column :registrations, :transid, :string
  end

  def down
  	remove_column :registrations, :transid
  end
end
