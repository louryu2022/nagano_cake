class SearchesController < ApplicationController
  def search
    @range = params[:range]
    if @range == "Item"
      @item = Item.looks(params[:search], params[:word])
    else
      @genre =Genre.looks(params[:search], params[:word])
    end
  end
end
