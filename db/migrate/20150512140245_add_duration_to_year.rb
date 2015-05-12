class AddDurationToYear < ActiveRecord::Migration
  def change
    add_column :years, :duration, :string
  end
end
