# frozen_string_literal: true

json.extract! floor, :id, :name, :description, :flevel
if params[:stacking_plan]
  json.spaces floor.spaces do |space|
    json.partial! 'spaces/space', space:
  end
end
json.url floor_url(floor, format: :json)
