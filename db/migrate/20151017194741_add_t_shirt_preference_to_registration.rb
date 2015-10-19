class AddTShirtPreferenceToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :tshirt_preference, :string
  end
end
