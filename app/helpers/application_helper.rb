module ApplicationHelper

    def stripe_button_link
      #express
        # stripe_url = "https://connect.stripe.com/express/oauth/authorize"
        # redirect_uri = stripe_connect_url
        # client_id = Credential.first.client_id
      
        # "#{stripe_url}?redirect_uri=#{redirect_uri}&client_id=#{client_id}"
      #standard
        stripe_url = "https://connect.stripe.com/oauth/authorize"
        response_type = "code"
        redirect_uri = stripe_connect_url
        client_id = "ca_GNMJI68nk1rDCZHkkRQJ2ElN4RUdeUlZ"
        scope = "read_write"
      
        "#{stripe_url}?response_type=#{response_type}&redirect_uri=#{redirect_uri}&client_id=#{client_id}&scope=#{scope}"
    end
end