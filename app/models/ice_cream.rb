class IceCream < ApplicationRecord
  belongs_to :brand
  belongs_to :user #creator of it
  has_many :reviews
  has_many :users, through: :reviews #people who have reviewed it
  #validates :flavor, uniqueness: { scope: :brand}


  def brand_attributes=(attributes)
    brand = Brand.find_or_create_by(attributes) if !attributes['name'].empty?
  end

  def not_a_repeat
    if IceCream.where(brand_id: brand_id, flavor: flavor).count > 0
      errors.add(:flavor, "has already been added")
    end
  end

  def avg_rating
    reviews.avg_rating
  end

  def self.top_three
    joins(:reviews).group(:id).order('avg(stars) desc').limit(3)
  end


end
