class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.string :value
      t.string :venue

      t.timestamps
    end
  end
end
