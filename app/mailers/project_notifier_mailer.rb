class ProjectNotifierMailer < ApplicationMailer
    def new_project_student
        @project = params[:project]
        student = Student.find(@project.student_id)
        user = User.find(student.user_id)
        @project_details = ProjectDetail.where(project_id: @project.id)[0]
        
        mail(to: user.email, subject: "Proyecto registrado exitosamente")
    end

    def new_project_professor
        @project = params[:project]
        profesor = Profesor.find(@project.professor_id)
        user = User.find(profesor.user_id)
        @project_details = ProjectDetail.where(project_id: @project.id)[0]
        
        mail(to: user.email, subject: "Proyecto registrado exitosamente")
    end
end
