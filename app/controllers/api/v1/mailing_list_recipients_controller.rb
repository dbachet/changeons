module Api
  module V1
    class MailingListRecipientsController < ApplicationController
      skip_before_filter :authenticate_user!

      def create
        mailing_list_recipient = MailingListRecipient.new(mailing_list_recipient_params)

        if mailing_list_recipient.save
          subscribe_email_to_mailchimp_list
          render json: mailing_list_recipient
        else
          render json: { errors: mailing_list_recipient.errors }, status: :unprocessable_entity
        end
      end

      private

        def subscribe_email_to_mailchimp_list
          MailingListService.new(
            list_id: Rails.application.secrets.mailchimp_list_id,
            email: mailing_list_recipient_params[:email]
          ).subscribe
        end

        def mailing_list_recipient_params
          params.require(:mailing_list_recipient).permit(:email)
        end
    end
  end
end