json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :name, :description, :user_id
  json.url ticket_url(ticket, format: :json)
end
