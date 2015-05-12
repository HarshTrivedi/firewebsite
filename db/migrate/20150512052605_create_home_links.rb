class CreateHomeLinks < ActiveRecord::Migration
  def change
    create_table :home_links do |t|
      t.string :name
      t.string :path
      t.references :year, index: true

      t.timestamps
    end
  end
end
