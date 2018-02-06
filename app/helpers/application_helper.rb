module ApplicationHelper


	def current_year
		year_value = request.original_url.split(/\/+/)[3] rescue nil
		year_value = nil if year_value.strip == "register"
		if year_value.nil? or year_value.strip == "static"
		    year = Year.where(:current => true).last || Year.last
		else
		    year = Year.where(:value => year_value.to_s).first
		    year = current_year if @year.nil?
		end
		year
	end

	def current_venue
		current_year.venue
	end

	# These theme color variables are no longer in use.
	def theme_color
		if current_year.value == "2015"
			return "#174E14"
		elsif current_year.value == "2016"
			return "#2D1504"
		else
			return "#078186"
		end
	end

	def title_transparency
		if current_year().value == "2018"
			return "0.6"
		elsif current_year().value == "2017"
			return "0.6"
		elsif current_year().value == "2015"
			return "0.7"
		else
			return "0.0"
		end
	end

# These title color variables are no longer in use.
	def title_color
		if current_year().value == "2015"
			return "#421E05"
		elsif current_year().value == "2016"
			return "#483300"
		else
			return "#012A2F"
		end
	end

end
