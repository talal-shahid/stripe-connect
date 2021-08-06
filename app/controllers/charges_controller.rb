class ChargesController < ApplicationController
    require "stripe"
    Stripe.api_key = Credential.first.secret_key
      def create
        begin
          charge = Stripe::Charge.create({
            amount: (params[:amount].to_i * 100).to_i, # total amount to charge,
            currency: "usd",
            source: params[:stripeToken], # token generated by Stripe in the frontend
            application_fee_amount: 0, # portion that goes to the Stripe platform account
          }, stripe_account: params[:account_no]) # id of the Stripe connected account
          redirect_to payment_thanks_path
      
          rescue Stripe::CardError => e
            flash[:error] = e.message
            redirect_to payment_error_path
          rescue Stripe::InvalidRequestError => e
            flash[:error] = e.message
            redirect_to payment_error_path
          rescue Stripe::RateLimitError => e
            flash[:error] = e.message
            redirect_to payment_error_path
          rescue Stripe::AuthenticationError => e
            flash[:error] = e.message
            redirect_to payment_error_path
          rescue Stripe::APIConnectionError => e
            flash[:error] = e.message
            redirect_to payment_error_path
          rescue Stripe::StripeError => e
            flash[:error] = e.message
            redirect_to payment_error_path
          rescue => e
            redirect_to payment_error_path
        end
      end
  end
  