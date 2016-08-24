class ListsController < ApplicationController
  before_action :list, except: [:new, :create, :index]
  before_action :bread_crumbs

  def index
    List.reset_bread_crumbs
    @lists = List.all
  end

  def show
    List.set_bread_crumbs(params[:id])
    @list_of_lists = List.where(list_id: @list.id)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    if @list.list_id
      list_id = @list.list_id
      @list.destroy
      redirect_to list_path(list_id)
    else
      @list.destroy
      redirect_to root_path
    end
  end

  def search
    @search_name = List.search_name(params[:name])
    @search_status = List.search_status(params[:status])
  end

  private
    def list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name, :description, :status)
    end

    def bread_crumbs
      @bread_crumbs = List.bread_crumbs
    end
end
