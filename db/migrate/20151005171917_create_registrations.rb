class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
    	t.string :name,						null: false, default: ""
    	t.string :affiliation
    	t.string :nationality, 		null: false, default: ""
    	t.string :email, 					null: false, default: ""
    	t.string :phone, 					null: false, default: ""
    	t.boolean :veg, 					null: false
    	t.integer :participation, 					null: false
    	t.integer :occupation, 					null: false
    	t.boolean :acm, 					null: false

      t.timestamps
    end
  end
end
