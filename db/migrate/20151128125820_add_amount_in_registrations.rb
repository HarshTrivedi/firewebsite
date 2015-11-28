class AddAmountInRegistrations < ActiveRecord::Migration
  def up
  	add_column :registrations, :dbamount, :integer, default: 0
  end

  def down
  	remove_column :registrations, :dbamount
  end
end
