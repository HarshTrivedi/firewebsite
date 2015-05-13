ActiveAdmin.register Tab do
	menu false

	belongs_to :home_link , :optional => true
	permit_params :name , :content , :home_link_id

	config.filters = false

	controller do

	    def new
	      @tab = Tab.new
	      @tab.home_link_id = params[:tab_id]
	    end

	    def create
	      @tab = Tab.new( permitted_params[:tab] )
	      @home_link = HomeLink.find_by_id(params[:home_link_id])
	      @home_link.tabs << @tab
	      create!
	    end

	    def edit
	      @tab = Tab.find_by_id(params[:id])
	      @tab.home_link_id = params[:home_link_id]
	    end

	    def update
	      @tab = Tab.find(params[:id])
	      @tab.update_attributes(permitted_params[:tab])
	      update!
	    end

	    def destroy
	      @tab = Tab.find_by_id(params[:id])
	      destroy! do |format|
	          format.html { redirect_to :back }
	      end
	    end
	    

	end 


  index do
        column :name
        actions
  end


  show do
      panel "Tab Details" do
        attributes_table_for tab do
            row("Tab Name") { tab.name }
            row("Content")  { raw tab.content  }
        end
      end
  end


	form do |f|
	      f.semantic_errors *f.object.errors.keys
	      f.inputs  "Tab Details" do
	          f.input :home_link_id, :as => :hidden ,  input_html: { :value => f.object.home_link_id }
	          f.input :name 
			  div :class => "editable_content" do
		          f.input :content 
		      end
	      end
	      f.actions
	end

end
