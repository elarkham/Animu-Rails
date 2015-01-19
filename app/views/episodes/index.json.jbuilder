json.array!(@episodes) do |episode|
  json.extract! episode, :id, :name, :show_id, :status, :dir, :grp
  json.url episode_url(episode, format: :json)
end
