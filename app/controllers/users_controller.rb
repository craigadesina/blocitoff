class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @items = @user.items
    @item = @items.new
  end
end