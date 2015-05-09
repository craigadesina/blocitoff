class ItemsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    #@items = @user.items
    @item = @user.items.build(params.require(:item).permit(:name))
    if @item.save
      flash[:notice] = 'item sucessfully saved'
      redirect_to user_path(@user)
    else
      flash[:error] = 'could not save the item'
      redirect_to user_path(@user)
    end
  end

end