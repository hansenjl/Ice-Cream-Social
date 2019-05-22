class Review < ApplicationRecord
  belongs_to :user
  belongs_to :ice_cream
end
