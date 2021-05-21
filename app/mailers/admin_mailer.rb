class AdminMailer < ApplicationMailer
  def custom_email
    @text = params[:text]
    @recipients = params[:to_indv] ? params[:to_indv] : params[:recipients]
    mail(to: @recipients, subject: params[:subject])
  end
end
