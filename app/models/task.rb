class Task < ApplicationRecord
  # SCOPES: trata de las consultas predefinidas y reutilizables
  
  # Trae solo las tareas de stado  'pendiente'
  scope :pending, -> { where(status: "pendiente") }
  
  # Trae solo las tareas de estado 'completada'
  scope :completed, -> { where(status: "completada") }
  
  # Trae solo las tareas de estado 'alta'
  scope :high_priority, -> { where(priority: "alta") }
end