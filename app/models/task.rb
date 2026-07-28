class Task < ApplicationRecord

  # ===========================================================
  # Estos son constantes.
  # Estos son los valores válidos para estos campos
  # ===========================================================
  STATUSES   = %w[pendiente en_progreso completada].freeze
  PRIORITIES = %w[baja media alta].freeze

  # ===========================================================
  # Estos son validaciones
  # Rails verifica estas reglas antes de guardar
  # ===========================================================

  # El título no puede estar vacío y debe tener entre 3 y 100 caracteres
  validates :title, presence: true,
                    length: { minimum: 3, maximum: 100 }

  # El status solo puede ser uno de los valores definidos en STATUSES
  validates :status, presence: true,
                     inclusion: { in: STATUSES,
                                  message: "debe ser: pendiente, en_progreso o completada" }

  # La prioridad solo puede ser uno de los valores definidos en PRIORITIES
  validates :priority, presence: true,
                       inclusion: { in: PRIORITIES,
                                    message: "debe ser: baja, media o alta" }

  # ===========================================================
  # SCOPES
  # Consultas predefinidas y reutilizables
  # ===========================================================

  # Trae solo las tareas de estado 'pendiente'
  scope :pending,       -> { where(status: "pendiente") }

  # Trae solo las tareas de estado 'completada'
  scope :completed,     -> { where(status: "completada") }

  # Trae solo las tareas de prioridad 'alta'
  scope :high_priority, -> { where(priority: "alta") }

  # Trae las tareas vencidas por ejemplo si lafecha límite pasada y no completadas
  scope :overdue,       -> { where("due_date < ? AND status != ?", Date.today, "completada") }

  # Ordena por fecha de creación, más recientes primero
  scope :recent,        -> { order(created_at: :desc) }

  # ===========================================================
  # Métodos de instancia se llaman sobre un objeto específico de la clase Task
  # ===========================================================

  # ¿Está completada esta tarea?
  def completed?
    status == "completada"
  end

  # ¿Está vencida esta tarea?
  def overdue?
    due_date.present? && due_date < Date.today && !completed?
  end

  # Marca la tarea como completada y guarda en la bdd
  def mark_as_completed!
    update!(status: "completada")
  end

end