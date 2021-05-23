class AdminMailer < ApplicationMailer
  def custom_email
    @text = params[:text]
    @recipients = params[:to_indv] ? params[:to_indv] : params[:recipients]
    mail(to: @recipients, subject: params[:subject])
  end

  def status_notify_email
    @is_student = params[:is_student]
    @subject = params[:subject]
    @status = params[:status]
    @recipient = params[:recipient]
    @project_name = params[:project_name]
    @professor_name = params[:professor_name]
    @student_name = params[:student_name]
    
    mail(to: @recipient, subject: @subject)
  end
end
