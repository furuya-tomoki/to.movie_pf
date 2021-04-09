class Public::CustomersController < ApplicationController

  def show
   @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path
    else
      render :edit
    end
  end



  def withdrawal
   @customer = Customer.find(params[:id])
    @customer.update(is_valid: false)
    reset_session
    # sessionの情報削除
    redirect_to root_path
  end

  def unsubscribe
    @customer = Customer.find(params[:id])
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :image, :is_valid, :email)
  end
end
