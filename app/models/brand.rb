class Brand < ApplicationRecord
  has_many :ice_creams
  validates :name, presence: true, uniqueness: true

  scope :alpha -> {order(:name)}

end
