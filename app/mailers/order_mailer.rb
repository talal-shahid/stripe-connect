class OrderMailer < ApplicationMailer
    default :from => 'connect@theconnectioninstitute.net'
    def send_invite(email)
        @email = email
        mail(to: email, subject: "You have received an invitation", from: 'connect@theconnectioninstitute.net')
    end
end
