ActiveAdmin.register Year do
    menu label: "Year" , :priority => 3
	permit_params :value, :venue , :duration , :current

	config.filters = false

    action_item :only => [:show , :edit ] do
       link_to( "Home Links" , admin_year_home_links_path(year)  )
    end

	index do
	      column :value
	      column :venue
	      column :duration
	      column :current
	      column :home_links do |year|
	          link_to( "home_links" , admin_year_home_links_path( year )  )
	      end
	      column :registrations do |year|
	          link_to( "registrations" , admin_year_registrations_path( year )  )
	      end
	      actions
	end

end
