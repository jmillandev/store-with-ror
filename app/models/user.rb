class User < ApplicationRecord
  has_secure_password # adds a password field and a password_digest field to the User model
  belongs_to :store
  has_many :tokens

  # Nested Attributes
  accepts_nested_attributes_for :store

  # Validations
  validates :email, :password_digest, :birthdate, :type, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_inclusion_of :type, in: %w[Owner Employee]
end
