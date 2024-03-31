class Building < Locationable
  has_many :floors, foreign_key: :parent_id, dependent: :destroy

  def spaces
    floors.flat_map(&:spaces)
  end

  def leases
    spaces.flat_map(&:leases)
  end

  def active_leases
    spaces.flat_map(&:active_leases)
  end
end
