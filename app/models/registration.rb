class Registration < ActiveRecord::Base

	belongs_to :year
	
	def self.occupationid(occ)
		case occ
		when "Student"
			return 1
		when "Industry"
			return 2
		when "Academia"
			return 3
		else
			return 0
		end
	end


	def amount

		if self.participation == 4
			return "Free"
		end

		return earlybird_amount if earlybird?

		## calculation 
		if self.nationality != "IN"
			return "300 USD"
		end

		if self.acm # IS ACM Member
			if self.occupation == 1 # Student
				return "3900 INR"
			elsif self.occupation == 2 # Industry
				return "15500 INR"
			elsif self.occupation == 3 # Academia
				return "6500 INR"
			end				
		else # IS Not ACM Member
			if self.occupation == 1 # Student
				return "4900 INR"
			elsif self.occupation == 2 # Industry
				return "15500 INR"
			elsif self.occupation == 3 # Academia
				return "8500 INR"
			end				
		end

		return "Undefined"
	end

	def earlybird?
		return created_at.to_date <= DateTime.new(2015,11,15)
	end

	def earlybird_amount

		## calculation
		if self.nationality != "IN"
			return "250 USD"
		end

		if self.acm # IS ACM Member
			if self.occupation == 1 # Student
				return "3900 INR"
			elsif self.occupation == 2 # Industry
				return "12500 INR"
			elsif self.occupation == 3 # Academia
				return "5000 INR"
			end
		else # IS Not ACM Member
			if self.occupation == 1 # Student
				return "4900 INR"
			elsif self.occupation == 2 # Industry
				return "12500 INR"
			elsif self.occupation == 3 # Academia
				return "6000 INR"
			end
		end

		return "Undefined"
	end

end
