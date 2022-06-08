# Preview all emails at http://localhost:3000/rails/mailers/project_notifier_mailer
class ProjectNotifierMailerPreview < ActionMailer::Preview
    def new_project_student
        project_details = ProjectDetail.where(project_id: 50)[0]
        ProjectNotifierMailer.with(project_detail: project_details).new_project_student
    end
end
