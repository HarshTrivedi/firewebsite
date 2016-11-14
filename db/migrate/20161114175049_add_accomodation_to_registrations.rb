class AddAccomodationToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :accomodation, :boolean, default: false
  end
end
