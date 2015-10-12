ActiveAdmin.register Registration do
	menu false
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
	  column :phone
	  column :approved
	  column :registration_type
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
