class Api::V1::TasksController < ApplicationController

  def index
    @tasks = Task.order('updated_at DESC')
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      render :show, status: :created
    else
      render json: @tasks.errors, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      render :show, status: :ok
    else
      render json: @tasks.errors, status: :unprocessable_entity
    end
  end

  private
    def task_params
      params.fetch(:task, {}).permit(
          :name, :is_done
      )
    end

end
