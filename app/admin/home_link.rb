ActiveAdmin.register HomeLink do
	menu false
	belongs_to :year , :optional => true
	permit_params :name , :path , :year_id

  config.filters = false

  controller do

    def new
      @home_link = HomeLink.new
      @home_link.year_id = params[:year_id]
    end

    def create
      @home_link = HomeLink.new( permitted_params[:home_link] )
      @year = Year.find_by_id(params[:year_id])
      @year.home_links << @home_link
      create!
    end

    def edit
      @home_link = HomeLink.find_by_id(params[:id])
      @home_link.year_id = params[:year_id]
    end

    def update
      @home_link = HomeLink.find(params[:id])
      @home_link.update_attributes(permitted_params[:home_link])
      update!
    end

    def destroy
      @home_link = HomeLink.find_by_id(params[:id])
      destroy! do |format|
          format.html { redirect_to :back }
      end
    end
    

  end 



  action_item :only => [:show , :edit ] do
     link_to( "Tabs" , admin_home_link_tabs_path( home_link )  )
  end


  form do |f|
      f.semantic_errors *f.object.errors.keys
      f.inputs  "Home Link Details" do
          f.input :year_id, :as => :hidden ,  input_html: { :value => f.object.year_id }
          f.input :name 
          f.input :path 
      end
      f.actions
  end

end
