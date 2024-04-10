# frozen_string_literal: true

json.extract! space, :id, :name, :description
if params[:stacking_plan] || params[:show_leases]
  json.leases space.leases do |lease|
    json.partial! 'leases/lease', lease:
  end
end
json.url space_url(space, format: :json)
