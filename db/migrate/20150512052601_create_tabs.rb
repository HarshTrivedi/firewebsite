class CreateTabs < ActiveRecord::Migration
  def change
    create_table :tabs do |t|
      t.text :content
      t.string :name
      t.references :home_link, index: true

      t.timestamps
    end
  end
end
