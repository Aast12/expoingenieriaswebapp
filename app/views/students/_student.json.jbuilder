json.extract! student, :id, :major, :student_code, :created_at, :updated_at
json.url student_url(student, format: :json)
