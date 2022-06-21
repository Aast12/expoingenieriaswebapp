module ProjectsHelper
  def project_filter_options
    [
      ['Nombre', :name],
      ['Categoria', :category],
      ['Area Temática', :area],
      ['Profesor', :professor],
      ['Departamento', :department],
      # ['Materia Relacionada', :],
      ['Campus', :institution],
      ['Sevicio Social', :social_service],
    ]
  end


  # Escala de calificación de calidad 
  def project_status_options_for_professor(project_id)
    [['REGISTRADO', "#{project_id}:registered"], ['APROBADO', "#{project_id}:approved"], 
    ['NO APROBADO', "#{project_id}:disapproved"], ['EVALUADO', "#{project_id}:evaluated"], 
    ['ACEPTADO', "#{project_id}:accepted"], ['RECHAZADO', "#{project_id}:rejected"], 
    ['DECLINADO', "#{project_id}:declined"], ['FALTÓ', "#{project_id}:missed"]]
  end

  def project_status_options_for_admin(project_id)
    [['REGISTRADO', "#{project_id}:registered"], ['APROBADO', "#{project_id}:approved"], 
    ['NO APROBADO', "#{project_id}:disapproved"], ['EVALUADO', "#{project_id}:evaluated"], 
    ['ACEPTADO', "#{project_id}:accepted"], ['RECHAZADO', "#{project_id}:rejected"], 
    ['DECLINADO', "#{project_id}:declined"], ['FALTÓ', "#{project_id}:missed"]]
  end

  def project_status_options_for_operative(project_id)
    [['Aceptado', 'accepted'], ['Faltó', "#{project_id}:missed"]]
  end

  def project_status_options_for_committee_member(project_id)
    [['Aceptado', "#{project_id}:accepted"], ['Faltó', "#{project_id}:missed"]]
  end

  
  def project_area(project)
    project_detail = project.project_detail
    project_detail.area
  end

  def project_description(project)
    project_detail = project.project_detail
    project_detail.description
  end

  def project_name(project)
    project_detail = project.project_detail
    project_detail.name
  end

  def project_professor(project)
    professor = Professor.find(project.professor_id)
    userProfessor = User.find(professor.user_id)
    userProfessor.full_name
  end

  def project_professor_email(project)
    professor = Professor.find(project.professor_id)
    userProfessor = User.find(professor.user_id)
    userProfessor.email
  end

  def project_professor_department(project)
    professor = Professor.find(project.professor_id)
    professor.department
  end

  def project_participants(project)
    participants = []
    participantsEntries = ProjectParticipant.all.where(project_id: project.id)
    participantsEntries.each do |entry|
      student = Student.find(entry.student_id)
      userStudent = User.find(student.user_id)
      participants.append(userStudent.full_name)
    end
    participants
  end

  def project_secondary_professors(project)
    professors = []
    profesorsEntries = SecondaryProfessor.all.where(project_id: project.id);
    profesorsEntries.each do |entry|
      prof = Professor.find(entry.professor_id);
      userProfessor  = User.find(prof.user_id);
      professors.append([userProfessor.full_name, userProfessor.email])
    end
    professors  
  end



  def project_score(project)
    committee_evaluation = project.committee_evaluation
    if committee_evaluation.problem == nil
      committee_evaluation.problem = 0
    end
    if committee_evaluation.methodology == nil
      committee_evaluation.methodology = 0
    end
    if committee_evaluation.feasibility == nil
      committee_evaluation.feasibility = 0
    end
    if committee_evaluation.results == nil
      committee_evaluation.results = 0
    end
    if committee_evaluation.impact == nil
      committee_evaluation.impact = 0
    end
    if committee_evaluation.ortography == nil
      committee_evaluation.ortography = 0
    end
    if committee_evaluation.description == nil
      committee_evaluation.description = 0
    end
    committee_evaluation.professor_score + committee_evaluation.problem + committee_evaluation.methodology + committee_evaluation.feasibility + committee_evaluation.results + committee_evaluation.impact + committee_evaluation.ortography + committee_evaluation.description
  end

  def project_stand(project)
    if project.project_event_detail
      project_event_details.stand
    else 
      nil
    end
  end

  def project_student(project)
    student = Student.find(project.student_id)
    userStudent = User.find(student.user_id)
    userStudent.full_name
  end

  def project_student_email(project)
    student = Student.find(project.student_id)
    userStudent = User.find(student.user_id)
    userStudent.email
  end

  def project_student_code(project)
    student = Student.find(project.student_id)
    student.student_code
  end

  def project_student_major(project)
    student = Student.find(project.student_id)
    student.major
  end

  def display_project_area(project)
    project_detail = project.project_detail
    display_project_detail_area(project_detail)
  end

  def display_project_professor_info(project)
    project_professor = project_professor(project)
    project_professor_email = project_professor_email(project)
    return "#{project_professor} - #{project_professor_email}"
  end


  def display_project_score(project)
    project_score = project_score(project)
    project_score.present? ? project_score : "N/A"
  end

  def project_social_impact(project)
    impact = project.social_impact
    impact.social_cause.present? || impact.social_commitment.present?
  end

  def display_project_stand(project)
    project_stand = project_stand(project)
    project_stand.present? ? project_stand : "N/A"
  end

  def display_project_status(project)
    project_status = project.status
    project_status_options().find { |key, value| value == project_status }.first
  end

  def display_project_student_info(project)
    project_student = project_student(project)
    project_student_email = project_student_email(project)
    return "#{project_student} - #{project_student_email}"
  end
 
end
