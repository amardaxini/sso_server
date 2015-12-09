json.array!(@client_apps) do |client_app|
  json.extract! client_app, :id, :name, :subdomain, :tenant_name
  json.url client_app_url(client_app, format: :json)
end
