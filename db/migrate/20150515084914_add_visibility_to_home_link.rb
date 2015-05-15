class AddVisibilityToHomeLink < ActiveRecord::Migration
  def change
    add_column :home_links, :visibility, :boolean
  end
end
