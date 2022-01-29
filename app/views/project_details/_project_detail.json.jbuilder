
json.extract! project_detail, :id, :name, :description, :semestre_i, :social_impact, :client_type, :project_id, :category, :area, :type_of, :academic_level, :created_at, :updated_at
json.url project_detail_url(project_detail, format: :json)
