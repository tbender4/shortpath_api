# frozen_string_literal: true

json.extract! visitor_type, :id, :building_id, :name, :category, :hide_barcode
json.url visitor_type_url(visitor_type, format: :json)
