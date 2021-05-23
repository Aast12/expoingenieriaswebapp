class AdminMailer < ApplicationMailer
  def custom_email
    @text = params[:text]
    @recipients = params[:to_indv] ? params[:to_indv] : params[:recipients]
    mail(to: @recipients, subject: params[:subject])
  end

  def status_notify_email
    # choose sepcific html depending on parameters
    # (should emails be stored as html/views or strings in the service?)
    
    mail(to: "eduxx77@gmail.com", subject: "test")
  end
end
