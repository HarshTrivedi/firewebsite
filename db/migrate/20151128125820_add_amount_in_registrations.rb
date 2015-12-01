class AddAmountInRegistrations < ActiveRecord::Migration
  def up
  	add_column :registrations, :dbamount, :string, default: ""
  end

  def down
  	remove_column :registrations, :dbamount
  end
end
