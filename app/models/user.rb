class User < ApplicationRecord
  has_many :reviews
  has_many :reviewed_ice_creams, through: :reviews, source: :ice_cream

  has_many :ice_creams #that they have created

  validates :username, uniqueness: true,  presence: true

  has_secure_password

  def self.from_google_omniauth(auth)
      where(username: auth.info.email).first_or_initialize do |user|
      user.username = auth.info.email
      user.password = SecureRandom.hex
    end
  end

end



