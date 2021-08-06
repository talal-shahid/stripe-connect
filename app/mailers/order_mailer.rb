class OrderMailer < ApplicationMailer
    def send_invite(email)
        @email = email
        mail(to: email, subject: "You have received an invitation")
    end
end
