class Public::RelationshipsController < ApplicationController
  before_action :authenticate_customer
  def create
    current_customer.follow(params[:id])
    redirect_to request.referer
    # 遷移前のURL取得
  end

  def destroy
    current_customer.unfollow(params[:id])
    redirect_to request.referer
  end

  def followings
    customer = Customer.find(params[:customer_id])
    @customers = customer.followings
  end

  def followers
    customer = Customer.find(params[:customer_id])
    @customers = customer.followers
  end

end
