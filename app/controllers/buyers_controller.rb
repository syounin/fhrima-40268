class BuyersController < ApplicationController
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @items = Item.find(params[:item_id])
    @buyerform = BuyerForm.new
  end

  def create
    @items = Item.find(params[:item_id])
    @buyerform = BuyerForm.new(buyer_params)
    if @buyerform.valid?
      pay_item
      @buyerform.save(params,current_user.id)
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
     @items = Item.find(params[:item_id])
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
end
