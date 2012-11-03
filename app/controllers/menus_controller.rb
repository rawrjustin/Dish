class MenusController < ApplicationController
  def new_cooked_menu
  end

  def new_catered_menu
  end

  def create_cooked_menu
    menu = CookedMenu.new(params["menu"])
    create_menu(menu)
  end

  def create_catered_menu
    menu = CateredMenu.new(params["menu"])
    create_menu(menu)
  end

  def create_menu(menu)
    if menu.valid?
      menu.save!
      flash[:notice] = "#{menu.name} saved!"
      redirect_to menus_path
    elsif
      flash[:notice] = menu.errors.to_a.join(", ")
      redirect_to menus_path
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

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
