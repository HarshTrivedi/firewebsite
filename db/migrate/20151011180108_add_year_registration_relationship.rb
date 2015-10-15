class AddYearRegistrationRelationship < ActiveRecord::Migration
  def change
    add_column :registrations, :year_id, :integer
  end
end
