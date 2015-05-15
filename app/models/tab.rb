class Tab < ActiveRecord::Base
	belongs_to :home_link
	acts_as_list scope: :home_link

	def self.visible
		where(:visibility => true)
	end

end
