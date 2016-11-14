class AddConferenceDateChoiceToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :conference_date_choice, :string
  end
end
