class Floor < Locationable
  belongs_to :building, foreign_key: :parent_id
  has_many :spaces, foreign_key: :parent_id, dependent: :destroy

  validates :flevel, numericality: true, presence: true, uniqueness: true
end
