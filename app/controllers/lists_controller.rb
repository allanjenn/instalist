class ListsController < ApplicationController


  def index
    @list = current_user.lists.all
  end
  
  #def destroy
   # @list = List.find(params[:id]) # Figure out which item based on the id
    #current_user.lists >> @list  # Use << to push the item into the user's items
    #redirect_to list_path  # Redirect them to items index
  #end

  def delete
    list = List.find(params[:id]).delete
    redirect_to lists_path
  end

  def destroy
    list = List.find(params[:id]).destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :image)
  end   
	
end

