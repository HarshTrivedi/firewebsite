class AddPositionToHomeLink < ActiveRecord::Migration
  def change
    add_column :home_links, :position, :integer
  end
end
