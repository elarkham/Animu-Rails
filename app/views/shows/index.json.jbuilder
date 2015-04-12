json.array!(@shows) do |show|
  json.extract! show, :id, :name, :status, :random
  json.url show_url(show, format: :json)
end
