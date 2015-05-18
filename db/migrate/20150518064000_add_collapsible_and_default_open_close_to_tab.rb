class AddCollapsibleAndDefaultOpenCloseToTab < ActiveRecord::Migration
  def change
    add_column :tabs, :collapsible, :boolean , :default => false
    add_column :tabs, :default_open, :boolean , :default => true
  end
end
