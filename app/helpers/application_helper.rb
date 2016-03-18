module ApplicationHelper


	def current_year
		year_value = request.original_url.split(/\/+/)[3].to_i rescue nil

	    if not year_value.nil?
	      year = Year.where(:value => year_value.to_s).first
	      year = current_year if @year.nil?
	    else
	      year_value = year.value
	      year = current_year
	    end
	    year
	end

end
