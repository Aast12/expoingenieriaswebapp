class MailingController < ApplicationController
  def mailing_center
    @project = Project.find(params[:id]) if (params[:id])
  end

  def send_email
    if (mailer_params[:to_indv])
      AdminMailer.with(mailer_params).custom_email.deliver
    else
      projects = params[:to] ? Project.filter_by_status(params[:to]) : Project.where(id: params[:id])
      projects.each do |project|
        AdminMailer.with(get_values(project)).custom_email.deliver
      end
    end
   
    respond_to do |format|
      format.html { redirect_to mailing_center_path }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def mailer_params
      params.permit(:subject, :text, :to_indv)
    end

    def get_values(project)
      vals = {
        recipients: get_emails(project),
        text: get_text(project),
        subject: mailer_params[:subject]
      }
    end

    def get_emails(project)
      if (params[:receiver] == 'all')
        [project.student.user.email, project.professor.user.email]
      else
        [project.student.user.email]
      end
    end

    def get_text(project)
      vars = { '$AR' => project.student.user.full_name,
               '$PT' => project.professor.user.full_name,
               '$NP' => project.project_detail.name,
               '$CR' => 'Clave de registro',
               '$CP' => project.project_detail.category,
               '$ST' => 'Stand', 
               '$DI' => 'Dia de la presentación' }
      mailer_params[:text].gsub(/\B\$\w+/, vars)
    end
end