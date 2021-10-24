class HomeLink < ActiveRecord::Base
  belongs_to :year
  has_many :tabs, -> { order(position: :asc) }
  acts_as_list


  def self.visible
  	where(:visibility => true)
  end


end
