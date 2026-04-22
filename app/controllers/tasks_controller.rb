class TasksController < ApplicationController
  # 1. Read
  def index
    @tasks = Task.order(created_at: :desc)
  end

  # 2. Create
  # ----new----- se refiere que muestra el formulario vacío en pantalla al usuario
  def new
    @task = Task.new
  end

  # ----create----- recibe los datos del formulario y esto los guarda en la base de datos
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path # Si se guarda bien , se regresa a la lista
    else
      render :new # Si es que falla vuelve a mostrar el formulario ojo
    end
  end

  # 3. Update
  # 'edit' busca la tarea específica para llenar el formulario con sus datos actuales
  def edit
    @task = Task.find(params[:id])
  end

  # 'update' guarda los cambios que se realizaron en la base de datos (ojito)
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  # 4. Delete
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private
  
  # de lo que ví es que Rails no permite q los usuarios inyecten datos a menos que se lo permita 
  def task_params
    params.require(:task).permit(:title, :description, :status, :priority, :due_date)
  end
end