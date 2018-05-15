class TasksController < ApplicationController
  before_action :init_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    init_task
  end

  def new
    @task = Task.new # So that we can use the keys to create the form
  end

  def create
    @task = Task.create(task_params)
    redirect_to task_path(@task.id)
  end

  def edit
    init_task
  end

  def update
    init_task
    @task.update(task_params)
    redirect_to task_path(@task.id)
  end

  def destroy
    init_task
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed) # Get the task hash, and select only keep only the parameters you want to use (so no admin = true can be done)
  end

  def init_task
    @task = Task.find(params[:id])
  end
end
