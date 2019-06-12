class Review < ApplicationRecord
  belongs_to :user
  belongs_to :ice_cream
  validates :title, presence: true
  validates :stars, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}

  validates :ice_cream, uniqueness: { scope: :user_id, message: "can only be reviewed once" }


  def self.avg_rating
    average(:stars)
  end



end
