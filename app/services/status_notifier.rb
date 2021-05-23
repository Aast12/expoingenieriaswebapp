class StatusNotifier < ApplicationService

    def initialize(project)
        @project = project
    end

    def call
        vals = {
            status: @project.status,
            project_name: @project.project_detail.name,
            student_name: get_name(@project.student.user),
            professor_name: get_name(@project.professor.user),
        }
        if @project.registered?
            vals[:subject] = "Proyecto ha sido Registrado en Conexión Tec"
            # Send "registered" email to professor so he can evaluate

            vals[:recipient] = @project.professor.user.email
            vals[:is_student] = false
            AdminMailer.with(vals).status_notify_email.deliver
        elsif @project.accepted?
            vals[:subject] = "Tu proyecto ha sido Aceptado en Conexión Tec"
            # Send "accepted" email to both professor and student

            vals[:recipient] = @project.professor.user.email
            vals[:is_student] = false
            AdminMailer.with(vals).status_notify_email.deliver

            vals[:recipient] = @project.student.user.email
            vals[:is_student] = true
            AdminMailer.with(vals).status_notify_email.deliver
        end
        return
    end

    def get_name(user)
        user.first_name.to_s + " " + user.last_name.to_s
    end
end