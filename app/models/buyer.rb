class Buyer < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one_attached :custom
end
