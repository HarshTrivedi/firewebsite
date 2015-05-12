class AddCurrentToYear < ActiveRecord::Migration
  def change
    add_column :years, :current, :boolean
  end
end
