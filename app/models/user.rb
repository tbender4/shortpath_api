# frozen_string_literal: true

# It's info is stored in contact table.
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :contact, dependent: :destroy
  before_save { build_contact unless contact }
  before_save :sync_contact_email, if: -> { email_changed? && !@syncing_email && contact.email != email }

  accepts_nested_attributes_for :contact

  alias_attribute :login, :email # Legacy

  private

  ## Disable callback to
  def sync_contact_email
    @syncing_email = true
    contact.update(email:)
    @syncing_email = false
  end
end
