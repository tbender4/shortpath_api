# frozen_string_literal: true

# Guest or user's info
class Contact < ApplicationRecord
  belongs_to :user, optional: true
  validates_uniqueness_of :user, allow_nil: true, unless: -> { user_id.nil? }
  belongs_to :visitor_type, optional: true

  # validates :visitor_type, presence: true, unless: -> { user_id.present? }
  # Above would be nice

  before_save :sync_user_email, if: -> { user && !@syncing_email && email_changed? && user.email != email }

  # before_validation :generate_uuid
  # validates_uniqueness_of :uuid

  private

  def sync_user_email
    @syncing_email = true
    user.update(email:)
    @syncing_email = false
  end

  # def generate_uuid
  #   uuid ||= SecureRandom.uuid
  # end
end
