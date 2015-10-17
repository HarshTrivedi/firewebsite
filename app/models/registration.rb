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
			return "250 USD"
		end

		if self.acm # IS ACM Member
			if self.occupation == 1 # Student
				"3900 INR"
			elsif self.occupation == 2 # Industry
				"5000 INR"
			elsif self.occupation == 3 # Academia
				"5500 INR"
			end				
		else # IS Not ACM Member
			if self.occupation == 1 # Student
				"4900 INR"
			elsif self.occupation == 2 # Industry
				"6000 INR"
			elsif self.occupation == 3 # Academia
				"12000 INR"
			end				
		end

		return "Undefined"
	end

end
