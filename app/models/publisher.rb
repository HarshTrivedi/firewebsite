class Publisher < ActiveRecord::Base

  belongs_to :year
  acts_as_list scope: :year

  def self.visible
  	where(:visibility => true)
  end

end
