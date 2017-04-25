json.extract! message, :id, :message, :author, :dialect, :created_at, :updated_at
json.url message_url(message, format: :json)
