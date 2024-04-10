# frozen_string_literal: true

json.extract! building, :id, :name, :code, :description
json.address do
  json.extract! building.address, :street1, :string2, :city, :province, :zip, :time_zone
end
if params[:stacking_plan]
  json.floors building.floors do |floor|
    json.partial! 'floors/floor', floor:
  end
end
json.url building_url(building, format: :json)
