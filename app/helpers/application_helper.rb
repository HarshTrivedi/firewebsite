module ApplicationHelper


	def current_year
		Year.where(:current => true).last || Year.last
	end

end
