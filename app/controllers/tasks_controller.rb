class TasksController < ApplicationController
	before_action :task, except: [:new, :create, :index]
	before_action :list, except: [:to_list, :show, :edit, :update, :destroy]
  def index
  	@tasks = @list.tasks.all
  end

  def show
  end

  def new
  	@task = Task.new
  end

  def create
  	@task = @list.tasks.new(task_params)
  	if @task.save
  		redirect_to list_path(@list)
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @list.task.update(task_params)
  		redirect_to list_path(@list)
  	else
  		render :edit
  	end
  end

  def destroy
  	@task = Task.find(params[:id])
  	@task.destroy
  	redirect_to list_path(@list)
  end

  def to_list
  	new_list = Task.to_list(Task.find(params[:id]))
    new_list.save
  	redirect_to list_path(new_list)
  end

  private
  	def list
  		@list = List.find(params[:list_id])
  	end

  	def task
  		@task = Task.find(params[:id])
  	end

  	def task_params
  		params.require(:task).permit(:name, :description, :status)
  	end

end
