class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_genre
  belongs_to :delivery_cost_genre
  belongs_to :delivery_day_genre
  belongs_to :item_condition_genre
  belongs_to :prefecture_genre
  
  validates :item_name, presence: true
  validates :item_explanation, presence: true, length: { maximum: 1000 }
    with_options presence: true, format: { with: /\A[0-9]+\z/ } do
     validates :item_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    end

  validates :delivery_cost_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_day_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :image, presence: true
  validates :user, presence: true
end
