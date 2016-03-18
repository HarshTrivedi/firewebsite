ActiveAdmin.register Publisher do
	menu false
	belongs_to :year , :optional => true
  permit_params :name , :image_name , :year_id , :visibility, :external_link, :image_width, :image_height

  config.filters = false

  config.sort_order = 'position_asc' # assumes you are using 'position' for your acts_as_list column
  config.paginate   = false # optional; drag-and-drop across pages is not supported

  sortable # creates the controller action which handles the sorting

  controller do

    def new
      @publisher = Publisher.new
      @publisher.year_id = params[:year_id]
    end

    def create
      @publisher = Publisher.new( permitted_params[:publisher] )
      @year = Year.find_by_id(params[:year_id])
      @year.publishers << @publisher
      create!
    end

    def edit
      @publisher = Publisher.find_by_id(params[:id])
      @publisher.year_id = params[:year_id]
    end

    def update
      @publisher = Publisher.find(params[:id])
      @publisher.update_attributes(permitted_params[:publisher])
      update!
    end

    def destroy
      @publisher = Publisher.find_by_id(params[:id])
      destroy! do |format|
          format.html { redirect_to :back }
      end
    end
    

  end 

  index do
        sortable_handle_column # inserts a drag handle
        column :name
        column :path
        column :visibility
        actions
  end

  form do |f|
      f.semantic_errors *f.object.errors.keys
      f.inputs  "Publisher Details" do
          f.input :year_id,  input_html: { :value => f.object.year_id }
          f.input :name 
          f.input :image_name
          f.input :external_link
          f.input :image_width
          f.input :image_height
          f.input :visibility , :as => :boolean
      end
      f.actions
  end

end
