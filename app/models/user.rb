class User < ApplicationRecord
  before_validation :set_code, if: proc { |u| u.new_record? }
  before_save { self.email = email.downcase }

  belongs_to :org
  has_many :attendances, dependent: :destroy

  attr_accessor :remember_token, :reset_token

  delegate :name, to: :org, prefix: true, allow_nil: false

  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :code, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_secure_password

  class << self
    def digest(string)
      BCrypt::Password.create(string, cost: BCrypt::Engine.cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?

    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def uri_for_qrcode
    "awesomeattendance://awesomehost/#{code}"
  end

  private

  def set_code
    return if code

    self.code = User.new_token
  end
end
