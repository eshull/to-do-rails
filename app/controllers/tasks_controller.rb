class TasksController < ApplicationController
  def index
    @list = List.find(params[:list_id])
    @tasks = Task.all
  end

  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
   @list = List.find(params[:list_id])
   @task = @list.tasks.new(task_params)
   if @task.save
     redirect_to list_path(@task.list)
   else
     render :new
   end
 end

 def show
   # @task = Task.find(params[:id])
   @list = List.find(params[:list_id])
   render "lists/show"
 end

 def edit
   @task = Task.find(params[:id])
   @list = List.find(params[:list_id])
   render :edit
 end

 def update
   @task = Task.find(params[:id])
   if @task.update(task_params)
     # binding.pry
     redirect_to list_task_path
   else
     render :edit
   end
 end

 def destroy
  @task = Task.find(params[:id])
  @task.destroy
  redirect_to list_path(@task.list)
end

private
 def task_params
   params.require(:task).permit(:description, :done)
 end

end
