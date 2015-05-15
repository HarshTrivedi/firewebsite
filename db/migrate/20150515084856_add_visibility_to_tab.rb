class AddVisibilityToTab < ActiveRecord::Migration
  def change
    add_column :tabs, :visibility, :boolean , :default => true
  end
end
