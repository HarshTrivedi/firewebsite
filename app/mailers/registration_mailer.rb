class RegistrationMailer < ActionMailer::Base
  default from: "irlab.daiict@gmail.com"

  def send_confirmation_mail( registration )
  	@registration = registration
    mail(to: registration.email , subject: "Registration Receipt")
  end

  def new_registration_notification_mail( registration )
  	@registration = registration
    mail(to: "irlab.daiict@gmail.com" , subject: "New Registration for FIRE")
  end

end
