json.extract! appointment, :id, :app_date, :app_time, :doctor_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
