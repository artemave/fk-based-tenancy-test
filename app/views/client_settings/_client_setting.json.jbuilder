json.extract! client_setting, :id, :client_id, :distributor_id, :name, :created_at, :updated_at
json.url client_setting_url(client_setting, format: :json)
