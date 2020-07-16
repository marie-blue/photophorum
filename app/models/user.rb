class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    before_save { self.email = email.downcase if email.present? }
    before_save { self.role ||= :member }

    validates :name, length: { minimum: 3, maximum: 20 }, presence: true

    validates :password, presence: true, length: { minimum: 6 }, if: -> { password_digest.nil? }
    validates :password, length: { minimum: 6 }, allow_blank: true
    validates :email,
              presence: true,
              uniqueness: { case_sensitive: true },
              length: { minimum: 10, maximum: 50 }

    has_secure_password

    enum role: [:member, :admin]
end
