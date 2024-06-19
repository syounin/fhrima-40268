class BuyerForm < ApplicationRecord

  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:post_code,:prefecture_id,:city,:address,:building,:telephone_number,:token
  
  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/}
    validates :token
  end

  def save(params,user_id)
    buyer = Buyer.create(item_id: params[:item_id].to_i, user_id: user_id)
    Custom.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, telephone_number: telephone_number, buyers_id: buyer.id)
    # 各テーブルにデータを保存する処理を書く
  end
end
