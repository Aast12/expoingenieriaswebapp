module ApplicationHelper
  def boolean_options
    [['Sí', true], ['No', false]]
  end

  def major_options
    ["IRS", "ITC", "ITD"]
  end

  def display_boolean_value(value)
    value ? "Sí" : "No"
  end

  def get_current_editions
    editions_available = []
    current_date = Date.today
    Edition.all.each do |edition|
      if edition.start_date <= current_date && edition.end_date >= current_date
          editions_available.push(edition)
      end
    end
    return editions_available
  end

  def get_current_edition_id
    current_date = Date.today
    Edition.all.each do |edition|
      if edition.start_date <= current_date && edition.end_date >= current_date
          puts "EDITION ID: " + "#{edition.id}"
          return edition.id
      end
    end
    return Edition.last.id
  end

  def get_current_edition_projects
    array = []
    current_edition_id = get_current_edition_id()

    committee_evaluations = CommitteeEvaluation.order('score + description + problem + methodology + feasibility + results + score + impact DESC')

    committee_evaluations.each do |committee_evaluation|
      project = committee_evaluation.project
      if project.evaluated? && project.edition_id == current_edition_id
        array.push(project)
      end
    end
    return array
  end

  def get_current_phase_name
    current_date = Date.today
    edition = current_user.edition
    edition.phases.each do |phase|
      if phase.start_date <= current_date && phase.end_date >= current_date
        return phase.name
      end
    end

  end

  def project_status_options
    [['Registrado', 'registered'], ['Aprobado', 'approved'], ['No aprobado', 'disapproved'],
     ['Evaluado', 'evaluated'], ['Aceptado', 'accepted'], ['Rechazado', 'rejected'],
     ['Declinado', 'declined'], ['Faltó', 'missed']]
  end
end
