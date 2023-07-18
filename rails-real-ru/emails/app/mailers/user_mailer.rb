# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation
    # BEGIN
    @user = params[:user]

    mail(
      subject: I18n.t('user_mailer.account_activation.subject'),
      to: @user.email
    )
    # END
  end
end
