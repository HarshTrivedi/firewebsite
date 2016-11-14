class AddTutorialsChoiceToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :tutorials_choice, :integer
  end
end
