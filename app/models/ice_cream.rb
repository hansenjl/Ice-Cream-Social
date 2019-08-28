class IceCream < ApplicationRecord
  belongs_to :brand
  belongs_to :user #creator of it
  has_many :reviews
  has_many :users, through: :reviews #people who have reviewed it
  has_one_attached :image

  validates :flavor, presence: true
  validate :not_a_duplicate

  scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')}

  def self.alpha
    order(:flavor)
  end


  def brand_attributes=(attributes)
    self.brand = Brand.find_or_create_by(attributes) if !attributes['name'].empty?
    self.brand
  end

  def thumbnail
    self.image.variant(resize: "100x100")
  end

  def not_a_duplicate
    # if there is already an ice cream with that flavor && brand, throw an error
    ice_cream = IceCream.find_by(flavor: flavor, brand_id: brand_id)
    if !!ice_cream && ice_cream != self
      errors.add(:flavor, 'has already been added for that brand')
    end
  end

  def brand_name
    brand.try(:name)
  end

  def flavor_and_brand
    "#{flavor} - #{brand.try(:name)}"
  end


end
