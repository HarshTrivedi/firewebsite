class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :external_link
      t.string :image_name
      t.string :image_width
      t.string :image_height
      t.references :year, index: true
      t.boolean :visibility, default: true
      t.integer  :position
      t.timestamps
    end
  end
end
