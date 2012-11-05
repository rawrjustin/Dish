class MenusController < ApplicationController
  def index
    @q = Menu.search(params[:q])
    results = @q.result(:distinct => true)
    if results.count > 0
      @menus = results
    else
      @menus = Menu.all
    end
  end

  def show
    @menu = Menu.find(params[:id])
    if @menu.type == "CookedMenu"
      render "show_cooked_menu"
    elsif @menu.type == "CateredMenu"
      render "show_catered_menu"
    end
  end
end
