json.extract! judge_evaluation, :id, :judge_id, :project_id, :score, :created_at, :updated_at
json.url judge_evaluation_url(judge_evaluation, format: :json)
