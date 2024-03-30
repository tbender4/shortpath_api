class Building < Locationable
  has_many :floors, foreign_key: :parent_id, dependent: :destroy
end
