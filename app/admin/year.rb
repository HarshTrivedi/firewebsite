ActiveAdmin.register Year do

	permit_params :value, :venue

	config.filters = false

    action_item :only => [:show , :edit ] do
       link_to( "Home Links" , admin_year_home_links_path(year)  )
    end

end
