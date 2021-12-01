# frozen_string_literal: true

module Account
  class User < ApplicationRecord
    include ApplyRole

    has_secure_password
    # validations
    validates :email, :password_digest, :age, presence: true
    validates :email, uniqueness: { case_sensitive: true }
    validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }
    validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 18, less_than_or_equal_to: 100 }
    validates :type, presence: false, allow_blank: true, if: proc { type.nil? }

    # callback methods
    after_create :role_assignment

    def role_assignment
      ApplyRole.assign_role(self)
    end
  end
end
