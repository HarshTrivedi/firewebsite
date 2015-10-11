class LandingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    current_year = Year.where(:current => true).last || Year.last
    home_link = current_year.home_links.first
    redirect_to fire_page_path(home_link.path)
  end

  def fire
  	permalink = params[:permalink]
  	@homelink = HomeLink.find_by_path(permalink)  	

    if @homelink.nil?
      current_year = Year.where(:current => true).last || Year.last
      @homelink = current_year.home_links.first
      redirect_to fire_page_path(@homelink.path)
    end

  	@tabs = @homelink.tabs
  	ap "permalink : #{permalink}"
  	ap "homelink  : #{@homelink}"
  	ap "tabs      : #{@tabs}"
  end

  def new_register
  end

  def register_submit

    name = params[:name] || ""
    aff = params[:affiliation] || ""
    nation = params[:nationality] || ""
    email = params[:email] || ""
    phone = params[:phone] || ""
    food = params[:food]
    participate = params[:participation]
    occ = params[:occupation]
    acm = params[:acm]
    acmnum = params[:acmnum] || nil
    transid = params[:transid] || ""

    if name.empty? ||
     aff.empty? ||
     nation.empty? ||
     email.empty? ||
     phone.empty? ||
     food.empty? ||
     participate.empty? ||
     occ.empty? #||
     # acm.empty? ||
     # transid.empty?

      error_msg = "Please fill all the information."
      redirect_to :back, :flash => {:error => error_msg}

    else
      r = Registration.create(name: name,
                             affiliation: aff,
                             nationality: nation,
                             email: email,
                             phone: phone,
                             veg: (food.eql? "veg"),
                             participation: participate,
                             occupation: Registration.occupationid(occ),
                             acm: acm,
                             acmnum: acmnum,
                             transid: transid)
      RegistrationMailer.send_confirmation_mail(params, 0, r.id).deliver
      redirect_to :back, :flash => {:success => "Successfully registered."}
    end
  end


  def download    
    filename = params[:filename]
    file_extension = params[:format]
    send_file(
      "#{Rails.root}/public/#{filename}.#{file_extension}",
      filename: "#{filename}.#{file_extension}",
      type: "application/pdf"
    )
  end

end
