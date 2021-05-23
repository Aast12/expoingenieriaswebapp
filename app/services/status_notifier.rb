class StatusNotifier < ApplicationService

    def initialize(project)
        @project = project
    end

    def call
        # Determine recipients (could be only professor)

        # Determine email headers and body

        # send email
        AdminMailer.status_notify_email.deliver
    end
end