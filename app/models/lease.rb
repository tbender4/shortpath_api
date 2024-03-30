class Lease < ApplicationRecord
  belongs_to :group
  belongs_to :space, foreign_key: :locationable_id
end
