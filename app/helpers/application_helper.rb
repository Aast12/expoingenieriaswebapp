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
      puts edition.inspect
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

    committee_evaluations = CommitteeEvaluation.order('score DESC')

    committee_evaluations.each do |committee_evaluation|
      project = committee_evaluation.project
      if project.approved? && project.edition_id == current_edition_id
        array.push(project)
      end
    end
    return array
  end

  def get_current_phase_id
    current_date = Date.today
    current_edition = Edition.find(get_current_edition_id())
    current_edition.phases.each do |phase|
      if phase.start_date <= current_date && phase.end_date >= current_date
        return phase.id
      end
    end
    return nil 
  end

  def get_current_phase_id_num
    current_phase_id = get_current_phase_id()
    if current_phase_id.present?
      return current_phase_id % 4 == 0 ? 4 : current_phase_id % 4
    else
      return nil
    end
  end

  def get_current_name
    current_date = Date.today
    current_phase = Phase.find(get_current_phase_id())
    current_phase.time_limits.each do |time_limit|
      if time_limit.start_date <= current_date && time_limit.end_date >= current_date
        puts "Time Limit ID: " + "#{time_limit.name}"
        return time_limit.name
      end
    end
    return nil
  end
end
