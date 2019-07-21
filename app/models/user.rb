class User < ApplicationRecord
  before_save { self.email = email.downcase }
  before_create { self.code = SecureRandom.base64 }

  belongs_to :org
  has_many :attendances, dependent: :destroy

  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :code, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_secure_password
end
