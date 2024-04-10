# frozen_string_literal: true

json.extract! floor, :id, :name, :description, :flevel
if params[:stacking_plan]
  json.spaces do
    @spaces = floor.spaces
    rendered_template = render(template: 'spaces/index', formats: [:json])
    json.merge! JSON.parse(rendered_template)
  end
end
json.url floor_url(floor, format: :json)
