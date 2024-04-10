# frozen_string_literal: true

# middle
class Floor < Locationable
  belongs_to :building, foreign_key: :parent_id
  has_many :spaces, class_name: 'Space', foreign_key: :parent_id, dependent: :destroy_async
  accepts_nested_attributes_for :spaces

  validates :flevel, numericality: true, presence: true
end
