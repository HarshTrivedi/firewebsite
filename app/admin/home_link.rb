ActiveAdmin.register HomeLink do
	menu false
	belongs_to :year , :optional => true
	permit_params :name , :path , :year_id

end
