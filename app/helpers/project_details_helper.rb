module ProjectDetailsHelper
  def project_detail_category_options()
    categories = ProjectCategory.all
    categories_map = []
    categories.each do |category|
      categories_map.append([category.name, category.name])
    end
    categories_map
  end
       
  def project_detail_area_options()
    areas = ProjectArea.all
    areas_map = []
    areas.each do |area|
      areas_map.append([area.name, area.name])
    end
    areas_map
  end

  def project_detail_type_of_options()
    [["Agrobiotecnología", "agrobiotechnology"]]
  end

  def project_detail_client_type_options()
    [["Departamento del Tec", "itesm_department"]]
  end

  def display_project_detail_category(project_detail)
    category = project_detail.category
  end

  def display_project_detail_area(project_detail)
    area = project_detail.area
    project_detail_area_options().find { |key, value| value == area }.first
  end

  def display_project_detail_type_of(project_detail)
    type_of = project_detail.type_of
    project_detail_type_of_options().find { |key, value| value == type_of }.first
  end

  def display_project_detail_client_type(project_detail)
    client_type = project_detail.client_type
    project_detail_client_type_options().find { |key, value| value == client_type }.first
  end

  def display_project_detail_academic_level(project_detail)
    academic_level = project_detail.academic_level
    project_detail_client_type_options().find { |key, value| value == academic_level }.first
  end
end
