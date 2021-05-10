class MailingController < ApplicationController
  def mailing_center
  end

  def send_email
    projects = Project.filter_by_status(mailer_params[:to])
    projects.each do |project|
      AdminMailer.with(get_values(project)).custom_email.deliver
    end
   
    respond_to do |format|
      format.html { redirect_to mailing_center_path }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def mailer_params
      params.permit(:to, :receiver, :subject, :text)
    end

    def get_values(project)
      vals = {
        recipients: get_emails(project),
        names: get_names(project),
        text: get_text(project),
        subject: mailer_params[:subject]
      }
    end

    def get_emails(project)
      if (mailer_params[:receiver] == 'all')
        [project.student.user.email, project.professor.user.email]
      else
        [project.student.user.email]
      end
    end

    def get_names(project)
      if (mailer_params[:receiver] == 'all')
        [project.student.user.full_name]
      else
        [project.student.user.full_name, project.professor.user.full_name]
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