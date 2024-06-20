class BuyersController < ApplicationController
  before_action :move_to_buyer
  before_action :items_find

  def index
    redirect_to root_path unless current_user.id != @items.user.id && @items.buyer.nil?
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buyerform = BuyerForm.new
  end

  def create
    @buyerform = BuyerForm.new(buyer_params)
    if @buyerform.valid?
      pay_item
      @buyerform.save(params,current_user.id)
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index
      end
  end
      
    private
    def buyer_params
    params.require(:buyer_form).permit(:post_code, :prefecture_id, :city, :address, :building, :telephone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @items.item_price,  # 商品の値段
        card: buyer_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end

    def move_to_buyer
      unless user_signed_in?
        redirect_to user_session_url
      end
    end
    def items_find
      @items = Item.find(params[:item_id])
    end
end
