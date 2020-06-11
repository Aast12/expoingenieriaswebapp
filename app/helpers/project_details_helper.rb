module ProjectDetailsHelper
  def project_detail_category_options()
    [["Desarrollo Tecnológico", "technological_development"]]
  end

  def project_detail_area_options()
    [["Biotecnología y alimentos", "biotechnology_and_food"]]
  end

  def project_detail_type_of_options()
    [["Agrobiotecnología", "agrobiotechnology"]]
  end

  def project_detail_client_type_options()
    [["Departamento del Tec", "itesm_department"]]
  end

  def display_project_detail_category(project_detail)
    category = project_detail.category
    project_detail_category_options().find { |key, value| value == category }.first
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
end
