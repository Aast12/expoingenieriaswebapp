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
    ProjectArea.all.collect { |area| [ area.name , area.name ] }
  end

  def professor_options
    #Project.all.distict.collect { |project| [project.professor] }
     Project.distinct.pluck(:professor, :professor)
    #Professor.all.collect { |professor| [ professor.user.full_name, professor.id ] }
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

#Productos O Servicios Para Emprendimiento De Base Tecnologica
#Productos O Servicios Para Emprendimiento De Base Tecnológica