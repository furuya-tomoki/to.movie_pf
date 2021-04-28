class Public::CustomersController < ApplicationController

  def mypage
    @favorites = Favorite.where(customer_id: current_customer.id)
  end

  def show
    @customer = Customer.find(params[:id])
    @favorites = Favorite.where(customer_id: current_customer.id)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
     @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
     redirect_to customer_path
    else
     render "edit"
    end
  end

     # 退会処理
  def withdrawal
    @customer = current_customer
    @customer.update(is_valid: false)
     # is_valid: false = 退会
     # 更新すると退会する
    reset_session
     # session = 登録情報の削除
    redirect_to root_path
  end

     # 退会確認画面
  def unsubscribe
    @customer = Customer.find_by(params[:id])
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :image, :is_valid, :email)
  end
end
