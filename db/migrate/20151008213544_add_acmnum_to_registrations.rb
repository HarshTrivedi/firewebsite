class AddAcmnumToRegistrations < ActiveRecord::Migration
  def up
  	add_column :registrations, :acmnum, :string
  end

  def down
  	remove_column :registrations, :acmnum
  end
end
