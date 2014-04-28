json.array!(@jobs) do |job|
  json.extract! job, :id, :title, :description, :start_date
  json.url job_url(job, format: :json)
end
