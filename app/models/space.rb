class Space < Locationable
  belongs_to :floor, foreign_key: :parent_id

  def building
    floor&.building
  end
end
