ActiveAdmin.register Sponsor do
	menu false
	belongs_to :year , :optional => true
  permit_params :name , :image_name , :year_id , :visibility, :external_link, :image_width, :image_height

  config.filters = false

  config.sort_order = 'position_asc' # assumes you are using 'position' for your acts_as_list column
  config.paginate   = false # optional; drag-and-drop across pages is not supported

  sortable # creates the controller action which handles the sorting

  controller do

    def new
      @sponsor = Sponsor.new
      @sponsor.year_id = params[:year_id]
    end

    def create
      @sponsor = Sponsor.new( permitted_params[:sponsor] )
      @year = Year.find_by_id(params[:year_id])
      @year.sponsors << @sponsor
      create!
    end

    def edit
      @sponsor = Sponsor.find_by_id(params[:id])
      @sponsor.year_id = params[:year_id]
    end

    def update
      @sponsor = Sponsor.find(params[:id])
      @sponsor.update_attributes(permitted_params[:sponsor])
      update!
    end

    def destroy
      @sponsor = Sponsor.find_by_id(params[:id])
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
      f.inputs  "Sponsor Details" do
          f.input :year_id,  input_html: { :value => f.object.year_id }
          f.input :name 
          f.input :image_width
          f.input :image_height
          f.input :image_name
          f.input :external_link
          f.input :visibility , :as => :boolean
      end
      f.actions
  end

end
