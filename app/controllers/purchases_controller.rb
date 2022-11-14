class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]
  

  def index 
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?   
      pay_item     
      @purchase_address.save  
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item 
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,  
      card: purchase_params[:token],  
      currency: 'jpy'                 
    )
  end


  def set_item 
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    unless @item.purchase==nil && @item.user_id != current_user.id 
      redirect_to root_path        
    end
  end  

end