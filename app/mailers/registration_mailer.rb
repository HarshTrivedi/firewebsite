class RegistrationMailer < ActionMailer::Base
  default from: "irlab.daiict@gmail.com"

   def send_confirmation_mail(params, amount, recordId)
   	@params = params
   	@amount = amount
   	@recordId = recordId
    mail(to: params[:email], subject: "Registration Receipt")
  end

end
