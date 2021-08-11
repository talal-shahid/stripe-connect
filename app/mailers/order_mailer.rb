class OrderMailer < ApplicationMailer
    default :from => 'usman.ghani720@gmail.com'
    def send_invite(email)
        @email = email
        mail(to: email, subject: "You have received an invitation", from: 'usman.ghani720@gmail.com')
    end
end
