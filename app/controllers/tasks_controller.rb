class TasksController < ApplicationController

  def index
    # get 'tasks'
    @tasks = Task.all
  end

  def show
    # get 'tasks/:id'
    @task = Task.find(params[:id])
  end

  def new
    # get 'tasks/new'
    @task = Task.new
  end

  def create
    # post 'tasks'
    @task = Task.new(task_params)
    @task.save

    # redirect to the index
    redirect_to tasks_path
  end

  def edit
    # get 'tasks/:id'
    @task = Task.find(params[:id])
  end

  def update
    # patch/put 'tasks/:id'
    @task = Task.find(params[:id])
    @task.update(task_params)

    # redirect to the index
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
