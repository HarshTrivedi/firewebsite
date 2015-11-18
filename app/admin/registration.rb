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
	  column :name
	  column :affiliation
	  column :nationality
	  column :email
	  column :phone
	  # column "ACM member ?", :acm
	  column "ACM membership number", :acmnum
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
	  column :occupation do |registration|
	  	if registration.occupation == 1
	  		"Student"
	  	elsif registration.occupation == 2
	  		"Industry"
	  	elsif registration.occupation == 3
	  		"Academia"
	  	end	  			  			  		
	  end

	  column :approved
	  column :registration_type
	  column :tshirt_preference
      column :created_at
	  actions
	end

	form do |f|
	  f.inputs "Approval Permission" do
	    f.input :approved
	  end
	  f.actions
	end


end
