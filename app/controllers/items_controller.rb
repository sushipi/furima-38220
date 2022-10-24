class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, only: [:edit]
  before_action :set_item, only: [:show, :edit,:update]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new 
    @item = Item.new
  end

  def create 
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path     
    else
      render :new
    end
  end

  def show 
  end 

  def edit 
  end

  def update 
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end    
  end

  def destroy 
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == item.user_id
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
