class RegistrationMailer < ActionMailer::Base
  default from: "irlab.daiict@fire.irsi.res.in"

  def send_confirmation_mail( registration )
  	@registration = registration
    mail(to: registration.email , subject: "Registration Details for FIRE 2018")
  end

  def new_registration_notification_mail( registration )
  	@registration = registration
    mail(to: "irlab.daiict@gmail.com" , subject: "New Registration for FIRE")
  end

end
