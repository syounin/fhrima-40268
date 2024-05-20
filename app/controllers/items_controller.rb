class ItemsController < ApplicationController
  before_action :move_to_item, except: [:index]

  def index
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_price, :delivery_cost_id, :item_explanation, :item_condition_id, :prefecture_id, :delivery_day_id, :category_id).merge(user_id: current_user.id)
  end
  def move_to_item
    unless user_signed_in?
      redirect_to user_session_url
    end
  end

end


