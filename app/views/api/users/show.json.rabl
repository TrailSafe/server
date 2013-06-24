object @user
attributes :first_name, :last_name, :phone_number
node(:activities){ api_user_activities_path }
node(:emergency_contacts){ api_user_emergency_contacts_path }