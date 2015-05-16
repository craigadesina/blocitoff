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

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      respond_to do |format|
      format.html {
      flash[:notice] = "Your todo Item was deleted"
      redirect_to(current_user)
    }
    format.js {
      render 'items/item_delete.js.erb'
    }
    end
    else
      respond_to do |format|
        format.html {
      flash[:error] = "Todo item couldn't be deleted. Try again."
      redirect_to(current_user)
    }
    format.js {
      render 'fail_delete.js.erb'
    }
    end
    end
  end
end