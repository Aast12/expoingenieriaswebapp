json.extract! project_detail, :id, :name, :description, :video_url, :semestre_i, :social_impact, :client_type, :project_id, :category, :area, :type_of, :created_at, :updated_at
json.url project_detail_url(project_detail, format: :json)
