json.extract! course, :id, :name, :code, :created_at, :updated_at
json.url course_url(course, format: :json)
