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
    country = params[:registration][:country] || ""
    email = params[:email] || ""
    phone = params[:phone] || ""
    food = params[:food]
    participate = params[:participation]
    occ = params[:occupation]
    acm = params[:acm]
    acmnum = params[:acmnum] || nil
    transid = params[:transid] || ""
    
    if params["t-shirt"] == "true"
      tshirt_preference = params["t-shirt-preference"]
    else
      tshirt_preference = nil    
    end

    if name.empty? ||
     aff.empty? ||
     country.empty? ||
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
      registration = Registration.create(name: name,
                             affiliation: aff,
                             nationality: country,
                             email: email,
                             phone: phone,
                             veg: (food.eql? "veg"),
                             participation: participate,
                             occupation: Registration.occupationid(occ),
                             acm: acm,
                             acmnum: acmnum,
                             transid: transid,
                             approved: false,
                             registration_type: "NEFT",
                             tshirt_preference: tshirt_preference
                             )
      current_year = Year.where(:current => true).last || Year.last
      registration.year = current_year
      registration.registration_number = "FIRE#{current_year.value}G#{registration.id.to_s.rjust(4, '0')}"
      registration.save
      RegistrationMailer.new_registration_notification_mail( registration ).deliver
      redirect_to "/fire/home", :flash => {:success => "Successfully registered. We will mail you the receipt on #{registration.email} once the registration is verified."}
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
