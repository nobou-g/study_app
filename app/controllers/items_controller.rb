class ItemsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :destroy, :pay]

  def new
    @item= Item.new
  end

  def create
    @item= Item.create(item_params)
    redirect_to user_path(current_user.id)
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
      alert('失敗しました')
    end
  end

  def destroy
    if @item.destroy
      redirect_to user_path(current_user)
    else
      render @item
    end
  end
  def pay
      Payjp.api_key = 'sk_test_6b4fc47bce523efc167dda60'
      charge = Payjp::Charge.create(
        amount:  @item.price,
        card: params['payjp-token'],
        currency: 'jpy',
      )
  end

  private

  def item_params
    params.require(:item).permit(:title, :discription, :image, :price).merge(user_id: current_user.id)
  end

  def set_params
    @item= Item.find(params[:id])
  end

end
