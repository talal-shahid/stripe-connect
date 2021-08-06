class Invitation < ApplicationRecord
    after_create do |invitation|
        OrderMailer.send_invite(invitation.email).deliver_now
    end
end
