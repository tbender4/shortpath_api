json.extract! event_occurrence, :id, :event_id, :start_time, :end_time, :created_at, :updated_at
json.url event_occurrence_url(event_occurrence, format: :json)
