json.array!(@workers) do |worker|
  json.extract! worker, :id, :about
  json.url worker_url(worker, format: :json)
end
