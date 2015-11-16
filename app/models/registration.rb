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

		## calculation 
		if self.nationality != "IN"
			return "300 USD"
		end
		if self.participation == 4
			return "Free"
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

end
