class AddAccordionToTabs < ActiveRecord::Migration
  def change
    add_column :tabs, :accordion, :boolean , :default => false
  end
end
