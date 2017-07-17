class User < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, :type, presence: :true
  before_create :set_auth_token

  private

  def set_auth_token
    return if auth_token.present?
    self.auth_token = generate_auth_token
  end

  def generate_auth_token
    loop do
      token = SecureRandom.hex
      break token unless self.class.exists?(auth_token: token)
    end
  end
end
