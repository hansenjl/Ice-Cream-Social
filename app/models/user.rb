class User < ApplicationRecord
  has_many :reviews
  has_many :reviewed_ice_creams, through: :reviews, source: :ice_cream

  has_many :ice_creams #that they have created

  validates :username, uniqueness: true,  presence: true
  validates :email, presence: true

  has_secure_password


  def self.create_by_google_omniauth(auth)
    self.find_or_create_by(username: auth[:info][:email]) do |u|
      u.password = SecureRandom.hex
    end
  end

  def self.create_by_github_omniauth(auth)
    self.find_or_create_by(username: auth[:info][:email]) do |u|
      u.password = SecureRandom.hex

    end
  end


end



