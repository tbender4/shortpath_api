json.extract! user, :id, :email, :login, :created_at, :updated_at
json.contact do
  json.extract! user.contact, :first_name, :middle_name, :last_name, :company, :title, :email, :primary_group_id
end
json.roles user.roles do |role|
  json.extract! role, :name, :resource_type
  json.resource { json.extract! role.resource, :id, :name } if role.resource
  # any other role attributes you want to include
end
json.url user_url(user, format: :json)
