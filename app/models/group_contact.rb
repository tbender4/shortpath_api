# frozen_string_literal: true

# Join table to keep track of previous contacts for an existing group.
class GroupContact < ApplicationRecord
  belongs_to :group
  belongs_to :contact
end
