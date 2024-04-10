# frozen_string_literal: true

json.extract! lease, :id, :start_date, :end_date, :state
json.group do
  json.partial! 'groups/group', group: lease.group
end
json.url lease_url(lease, format: :json)
