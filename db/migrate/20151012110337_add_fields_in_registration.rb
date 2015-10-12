class AddFieldsInRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :approved, :boolean , :default => false
    add_column :registrations, :registration_number, :string
    add_column :registrations, :registration_type, :string
  end
end
