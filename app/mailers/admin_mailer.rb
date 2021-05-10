class AdminMailer < ApplicationMailer
  def custom_email
    @text = params[:text]
    mail(to: params[:recipients], subject: params[:subject])
  end
end
