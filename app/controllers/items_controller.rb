class ItemsController < ApplicationController

  def index
    if params[:user_id] # :user_id is added to the params hash thru the nested routes resources
      user = find_user
      items = user.items
    else
      items = Item.all
    end
    render json: items, include: :user, status: :ok
  end

  def show
    item = Item.find(params[:id])
    render json: item, status: :ok
  end

  def create
    user = find_user
    item = user.items.create(item_params)
    render json: item, status: :created
  end

  private

  def find_user
    User.find params[:user_id]
  end

  def item_params
    params.permit(:name, :description, :price, :user_id)
  end

end
