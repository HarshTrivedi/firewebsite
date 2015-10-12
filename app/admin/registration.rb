ActiveAdmin.register Registration do
	menu false
	belongs_to :year , :optional => true
  	permit_params :approved

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
