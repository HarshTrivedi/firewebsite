class AddAttendanceChoiceToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :attendance_choice, :integer
  end
end
