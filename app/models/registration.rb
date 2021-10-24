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

		tutorial_bucks, tutorial_currency = amount_tutorials.split(" ")
		conference_bucks, conference_currency = amount_conference.split(" ")

		if self.attendance_choice == 1 
			return "#{conference_bucks} #{conference_currency}"
		elsif self.attendance_choice == 2
			return "#{tutorial_bucks} #{tutorial_currency}"
		else
			return "#{conference_bucks} #{conference_currency}"
			/*if tutorial_currency == conference_currency
				final = tutorial_bucks.to_i + conference_bucks.to_i 
				return "#{conference_bucks} #{conference_currency}"
			else
				return "#{conference_bucks} #{conference_currency}"
			end*/
		end
	end

	def amount_tutorials
		if self.occupation == 1 # student
			tutorials_amount = "0 INR"
		else
			tutorials_amount = "0 INR"
		end
		#if self.tutorials_choice == nil  # attending none of tutorials
		#	tutorials_amount = "0 INR"
		#elsif self.tutorials_choice == 3 # attending both tutorials
		#	if self.occupation == 1 # student
		#		tutorials_amount = "750 INR"
		#	else
		#		tutorials_amount = "1000 INR"
		#	end
		#else  # attending only one of two tutorials
		#	if self.occupation == 1 # student
		#		tutorials_amount = "500 INR"
		#	else
		#		tutorials_amount = "750 INR"
		#	end
		#end 			

	end

	def amount_conference

		return onspot_amount if self.registration_type == "ONSPOT"

		## calculation
		if self.nationality != "IN"
			if self.acm # IS ACM Member
				return "0 USD"
			else
				return "0 USD"
			end
		end

		if self.acm # IS ACM Member
			if self.occupation == 1 # Student
				return "0 INR"
			elsif self.occupation == 2 # Industry
				return "0 INR"
			elsif self.occupation == 3 # Academia
				return "0 INR"
			end
		else # IS Not ACM Member
			if self.occupation == 1 # Student
				return "0 INR"
			elsif self.occupation == 2 # Industry
				return "0 INR"
			elsif self.occupation == 3 # Academia
				return "0 INR"
			end
		end


		return "Undefined"
	end

	# def earlybird?
	# 	return created_at.to_date <= DateTime.new(2016,11,15)
	# end

	def onspot_amount

		## calculation 
		if self.nationality != "IN"
			if self.acm # IS ACM Member
				return "0 USD"
			else
				return "0 USD"
			end
		end

		if self.acm # IS ACM Member
			if self.occupation == 1 # Student
				return "0 INR"
			elsif self.occupation == 2 # Industry
				return "0 INR"
			elsif self.occupation == 3 # Academia
				return "0 INR"

			end				
		else # IS Not ACM Member
			if self.occupation == 1 # Student
				return "0 INR"
			elsif self.occupation == 2 # Industry
				return "0 INR"
			elsif self.occupation == 3 # Academia
				return "0 INR"
			end				
		end



		return "Undefined"
	end

end
