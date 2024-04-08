# frozen_string_literal: true

# middle
class Floor < Locationable
  belongs_to :building, foreign_key: :parent_id
  has_many :spaces, foreign_key: :parent_id # Will not dependent: :destroy to prevent Visits from breaking

  validates :flevel, numericality: true, presence: true, uniqueness: true
end
