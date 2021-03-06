class StripeController < ApplicationController
    require "stripe"
    require 'httparty'
    Stripe.api_key = Credential.first.secret_key
      before_action :authenticate_user!
      def connect
        response = HTTParty.post("https://connect.stripe.com/oauth/token",
          query: {
            client_secret: Credential.first.secret_key,
            code: params[:code],
            grant_type: "authorization_code",
          }
        )
        if response.parsed_response.key?("error")
            redirect_to payments_new_path
            #notice: response.parsed_response["error_description"]
        else
          stripe_user_id = response.parsed_response["stripe_user_id"]
          current_user.update_attribute(:stripe_user_id, stripe_user_id)
          begin
            Stripe::Account.update_capability(
              stripe_user_id,
              'card_payments',
              {requested: true},
            )
            Stripe::Account.update_capability(
              stripe_user_id,
              'transfers',
              {requested: true},
            )
          rescue => e
          end
          redirect_to payments_new_path
          #notice: 'User successfully connected with Stripe!'
        end
      end
  end
  