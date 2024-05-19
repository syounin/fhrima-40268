class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:new]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(article_params)
    if @items.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_price, :delivery_cost_id, :item_explanation, :item_condition_id, :prefecture_id, :delivery_day_id, :category_id, :user).merge(user_id: current_user.id)
  end

end


