class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :categpry_genre
  belongs_to :delivery_cost_genre
  belongs_to :delivery_day_genre
  belongs_to :item_condition_genre
  belongs_to :prefecture_genre
  
  validates :item_name, :item_price, :item_explanation, presence: true

  validates :delivery_cost_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :categpry_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_day_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 


end
