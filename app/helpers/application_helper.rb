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

	def theme_color
		if current_year.value == "2015"
			return "#174E14"
		else
			return "#2D1504"
		end
	end

	def title_transparency
		if current_year.value == "2015"
			return "0.7"
		else
			return "0.0"
		end
	end

	def title_color
		if current_year.value == "2015"
			return "#421E05"
		else
			return "#DFAB3B"
		end
	end

end
