class User < ApplicationRecord
    before_save { self.email = email.downcase if email.present? }
    validates :name, length: { minimum: 3, maximum: 20 }, presence: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :password, length: { minimum: 6 }, allow_blank: true
    validates :email,
              presence: true,
              uniqueness: { case_sensitive: true },
              length: { minimum: 10, maximum: 50 }
    has_secure_password
end
