module Api
  module V1
    class MailingListRecipientsController < ApplicationController
      skip_before_filter :authenticate_user!

      def create
        mailing_list_recipient = MailingListRecipient.new(mailing_list_recipient_params)

        if mailing_list_recipient.save
          if subscribe_email_to_mailchimp_list == :already_subscribed_to_list
            render json: { errors: already_subscribed_to_list_error }, status: :unprocessable_entity
          else
            render json: mailing_list_recipient
          end
        else
          render json: { errors: mailing_list_recipient.errors }, status: :unprocessable_entity
        end
      end

      private

        def already_subscribed_to_list_error
          { email: ["a déjà été ajouté à la liste"] }
        end

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