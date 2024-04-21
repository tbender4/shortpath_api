# frozen_string_literal: true

# It's info is stored in contact table.
class User < ApplicationRecord
  rolify # before_add: :remove_orphaned_group_member
  include Role::QueryHelper

  # rolify :before_add => :before_add_method

  def before_add_method(role)
    # do something before it gets added
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :contact, dependent: :destroy
  validate :contact_must_exist
  before_save :sync_contact_email

  accepts_nested_attributes_for :contact

  alias_attribute :login, :email # Legacy

  def make_superuser
    add_role :superuser
  end

  private

  # Ensure contact record existence is not orphaned.
  def contact_must_exist
    errors.add(:contact, 'must exist') unless contact
  end

  def sync_contact_email
    return unless email_changed? && !@syncing_email && contact.email != email

    @syncing_email = true # Disable callback to sync the user email without recursion
    contact.update(email:)
    @syncing_email = false
  end
end
