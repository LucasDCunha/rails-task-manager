class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to root_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(params[:id])
  end

  def destroy
    @task.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to root_path
  end

  def set_task
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
