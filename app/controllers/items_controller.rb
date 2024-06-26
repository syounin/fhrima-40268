class ItemsController < ApplicationController
  before_action :move_to_item, except: [:index, :show]
  before_action :set_items, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_url, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.sort.reverse
     
  end

  def show
  end

  def edit
  end

  def update
    if @items.update(item_params)
    redirect_to item_path(@items.id)
    else
    render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @items.destroy
    redirect_to root_path
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

  def set_items
    @items = Item.find(params[:id])
  end
  def item_url
    if @items.user_id != current_user.id || @items.buyer != nil 
      redirect_to root_path
    end
  end
end


