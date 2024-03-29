class LandingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    current_year = Year.where(:current => true).last || Year.last
    year_value = current_year.value
    home_link = current_year.home_links.first
    redirect_to year_wise_fire_page_path(year_value, home_link.path)
  end

  def fire
  	permalink = params[:permalink]
    year_value = params[:year]
    current_year = Year.where(:current => true).last || Year.last

    if year_value == "static"
        @year = current_year
        @homelink = HomeLink.find_by_path(permalink)
    elsif year_value.nil?
        @year = current_year
        year_value = current_year.value
        home_link = current_year.home_links.first
        redirect_to year_wise_fire_page_path(year_value, home_link.path) and return
    else
      @year = Year.where(:value => year_value.to_s).first
      @year = current_year if @year.nil?
      @homelink = @year.home_links.find_by_path(permalink)
    end


    if @homelink.nil?
      @homelink = current_year.home_links.first
      redirect_to year_wise_fire_page_path(year_value, @homelink.path)
    end

  	@tabs = @homelink.tabs
  	ap "permalink : #{permalink}"
  	ap "homelink  : #{@homelink}"
  	ap "tabs      : #{@tabs}"
    ap "year      : #{@year}"
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
    attendance_choice = params['attendance-choice']
    tutorials_choice = params['tutorials-choice']    
    conference_date_choice = params['conference-date-choice'].keys.join(",") rescue nil
    accomodation = params[:accomodation]
    registration_type = params[:registration_type]

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
     attendance_choice.empty? ||
     accomodation.empty? #||
     # tutorials_choice.empty? ||
     # conference_date_choice.empty?

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
                             registration_type: registration_type,
                             tshirt_preference: tshirt_preference,
                             attendance_choice: attendance_choice,
                             tutorials_choice: tutorials_choice,
                             conference_date_choice: conference_date_choice,
                             accomodation: accomodation
                             )
      current_year = Year.where(:current => true).last || Year.last
      registration.year = current_year
      registration.registration_number = "FIRE#{current_year.value}G#{registration.id.to_s.rjust(4, '0')}"
      registration.save
      RegistrationMailer.new_registration_notification_mail( registration ).deliver
      redirect_to "/fire/home", :flash => {:success => "Your registration has been confirmed. You will receive the receipt on #{registration.email} after your transaction is verified by us. The verification process will take around a week."}
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
