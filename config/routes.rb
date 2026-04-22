Rails.application.routes.draw do
 #Crea todas las rutas estándar para hacer CRUD con las tareas
 # A comparación de otros lenguajes, Rails crea de manera automática 
 #las rutas para CADA acción :o
 resources :tasks

  # Y en esta parte se define la ruta RAÍZ de la aplicación 
  #Lo que significa ve al controlador de Tasks y ejecuta la acción --index-- ojo con eso Bri
  root 'tasks#index'
end