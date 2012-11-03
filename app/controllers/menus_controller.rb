class MenusController < ApplicationController
  def new
  end

  def create
    @menu = Menu.new(params["menu"])
    if @menu.valid?
      @menu.save!
      flash[:notice] = "#{@menu.name} saved!"
      redirect_to menu_path(@menu.id)
    elsif
      flash[:notice] = @menu.errors.to_a.join(", ")
      redirect_to new_menu_path
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
  end
end
