class AddPositionToTab < ActiveRecord::Migration
  def change
    add_column :tabs, :position, :integer
  end
end
