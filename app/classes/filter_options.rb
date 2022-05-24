=begin 
class FilterOptions
  def initialize
    @options = {
      'category' => category_options(),
      'area' => area_options(),
      'professor' => professor_options(),
      'institution' => institution_options(),
      'department' => department_options(),
      'social_service' => [["",""],['Si', true], ['No', false]],
      'status' => status_options()
    }
  end

  def get_options(type)
    @options[type]
  end

  private

  
  def category_options
    ProjectDetail.all.collect { |project_details| [ project_details.category, project_details.category ] }.uniq.unshift('')
  end

  def area_options
    ProjectDetail.all.collect { |project_details| [ project_details.area , project_details.area  ] }.uniq.unshift('')
  end

  def professor_options
    Project.joins("INNER JOIN virtual_samples ON virtual_samples.project_id = projects.id").all.collect  { |project| [project.professor, project.professor] }.uniq.unshift('')
  end

  def institution_options
    Project.all.collect { |project| [ project.campus, project.campus ] }.uniq
  end

  def department_options
    Department.all.collect { |department| [ department.name, department.id ] }
  end

  def status_options
    [['Registrado', 'registered'], ['Aprobado', 'approved'], ['No aprobado', 'disapproved'],
     ['Evaluado', 'evaluated'], ['Aceptado', 'accepted'], ['Rechazado', 'rejected'],
     ['Declinado', 'declined'], ['Faltó', 'missed']]
  end
end

=end
class FilterOptions
  def initialize
    @options = {
      'category' => category_options(),
      'area' => area_options(),
      'professor' => professor_options(),
      'institution' => institution_options(),
      'department' => department_options(),
      'social_service' => [['Si', true], ['No', false]],
      'status' => status_options()
    }
  end

  def get_options(type)
    @options[type]
  end

  private
  def category_options
    ProjectCategory.all.collect { |category| [ category.name, category.name ] }
  end

  def area_options
    ProjectArea.all.collect { |area| [ area.name, area.name ] }
  end

  def professor_options
    Professor.all.collect { |professor| [ professor.user.full_name, professor.id ] }
  end

  def institution_options
    Institution.all.collect { |institution| [ institution.name, institution.id ] }
  end

  def department_options
    Department.all.collect { |department| [ department.name, department.id ] }
  end

  def status_options
    [['Registrado', 'registered'], ['Aprobado', 'approved'], ['No aprobado', 'disapproved'],
     ['Evaluado', 'evaluated'], ['Aceptado', 'accepted'], ['Rechazado', 'rejected'],
     ['Declinado', 'declined'], ['Faltó', 'missed']]
  end
end