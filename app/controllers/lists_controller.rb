class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params[:id])
    @list.save
    redirect_to list_path
  end

  private

  def restaurant_params
   # TODO params.require(:)
  end
end
