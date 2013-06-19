object false
node(:current_activity){ api_current_activity_path }
node(:current_help_request){ api_current_help_request_path }
node(:user){ api_user_path }
node(:api_info) do
  { version: 1 }
end