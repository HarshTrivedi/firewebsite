ActiveAdmin.register Tab do
	menu false

	belongs_to :home_link , :optional => true
	permit_params :name , :content , :home_link_id , :visibility , :collapsible , :default_open , :accordion

	config.sort_order = 'position_asc' # assumes you are using 'position' for your acts_as_list column
	config.paginate   = false # optional; drag-and-drop across pages is not supported

	sortable # creates the controller action which handles the sorting
	
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
		sortable_handle_column # inserts a drag handle
        column :name
        column :visibility
        column :collapsible
        column :default_open
        column :accordion
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
	          f.input :visibility , :as => :boolean
	          f.input :collapsible , :as => :boolean
	          f.input :default_open , :as => :boolean
	          f.input :accordion , :as => :boolean

	          if f.object.id.nil?
	          	  text_node("Create Tab and visit its Edit page for updating html content")
			  else
				  text_node( link_to "Open Content Editor", edit_content_path( :model_name => "tab", :id => f.object.id, :attribute => "content", :redirection_link => request.original_url ) )
			  end
	      end
	      f.actions
	end

end
