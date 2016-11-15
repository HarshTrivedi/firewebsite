ActiveAdmin.register Registration do
	menu label: "Registrations" , :priority => 4
	belongs_to :year , :optional => true
  	permit_params :approved, :dbamount

	controller do

	      def update
	        @registration = Registration.find_by_id(params[:id])
	        @registration.update_attributes(permitted_params[:registration])

		    if params[:registration][:approved] == "1"
			  RegistrationMailer.send_confirmation_mail( @registration ).deliver
	        end
	        update!
	      end

	end

	index do
	  selectable_column
	  column :registration_number
      column :created_at
	  column :name

		column :occupation do |registration|
			if registration.occupation == 1
				"Student"
			elsif registration.occupation == 2
				"Industry"
			elsif registration.occupation == 3
				"Academia"
			end
		end

		column 'attendance-choice' do |registration|
			if registration.attendance_choice == 1
				"Main Conference"
			elsif registration.attendance_choice == 2
				"Tutorials"
			elsif registration.attendance_choice == 3
				"Both"
			end
		end

		column 'tutorials-choice' do |registration|
			if registration.tutorials_choice == 1
				"Author Profiling"
			elsif registration.tutorials_choice == 2
				"Deep Learning"
			elsif registration.tutorials_choice == 3
				"Both"
			else
				"Nil"
			end
		end

		column 'conference-date-choice' do |registration|
			registration.conference_date_choice
		end

		column "ACM member ?", :acm

		column :participation do |registration|
			if registration.participation == 1
				"Presenting a paper"
			elsif registration.participation == 2
				"Participating in a track"
			elsif registration.participation == 3
				"Attending"
			elsif registration.participation == 4
				"I am a speaker / I am from organizing committee"
			end
		end

		
	  column :registration_type
	  column :approved
	  column :amount
	  column :dbamount
	  column :accomodation
	  actions
	end

	form do |f|
	  f.inputs "Approval Permission" do
	    f.input :dbamount
	    f.input :approved
	  end
	  f.actions
	end


end
