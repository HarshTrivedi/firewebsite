class CreateTabs < ActiveRecord::Migration
  def change
    create_table :tabs do |t|
      t.text :content
      t.string :name

      t.timestamps
    end
  end
end
