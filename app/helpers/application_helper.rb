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

  def get_current_edition_id
    current_date = Date.today
    Edition.all.each do |edition|
      if edition.start_date <= current_date && edition.end_date >= current_date
          return edition.id
      end
    end
  end

  def get_current_edition_projects
    array = []
    current_edition_id = get_current_edition_id()

    committee_evaluations = CommitteeEvaluation.order('score DESC')

    committee_evaluations.each do |committee_evaluation|
      project = committee_evaluation.project
      if project.approved? && project.edition_id == current_edition_id
        array.push(project)
      end
    end
    return array
  end
end
