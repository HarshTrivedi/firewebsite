ActiveAdmin.register Tab do
	menu false

	belongs_to :home_link , :optional => true
	permit_params :name , :content

end
