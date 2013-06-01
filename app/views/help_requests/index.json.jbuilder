json.array!(@help_requests) do |help_request|
  json.extract! help_request, 
  json.url help_request_url(help_request, format: :json)
end