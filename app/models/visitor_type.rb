# frozen_string_literal: true

# We're making these mandatory for sure it's an important part of the app.
class VisitorType < ApplicationRecord
  belongs_to :building
  validates :building, presence: true
end
