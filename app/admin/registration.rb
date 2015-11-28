ActiveAdmin.register Registration do
	menu label: "Registrations" , :priority => 4
	belongs_to :year , :optional => true
  	permit_params :approved

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

		column "ACM member ?", :acm

		column :participation do |registration|
			if registration.participation == 1
				"Presenting a paper"
			elsif registration.participation == 2
				"Participating in a track"
			elsif registration.participation == 3
				"Attending"
			elsif registration.participation == 4
				"I'm in organizing committee"
			end
		end

	  column :approved
	  column :amount
	  column :dbamount
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
