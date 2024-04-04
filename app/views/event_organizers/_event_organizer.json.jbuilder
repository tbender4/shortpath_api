json.extract! event_organizer, :id, :event_id, :user_id, :created_at, :updated_at
json.url event_organizer_url(event_organizer, format: :json)
