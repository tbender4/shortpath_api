class Contact < ApplicationRecord
  # before_validation :generate_uuid
  # validates_uniqueness_of :uuid

  private
    # def generate_uuid
    #   uuid ||= SecureRandom.uuid
    # end
end
