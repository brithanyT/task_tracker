require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # En desarrollo, el código se recarga automáticamente al cambiar archivos.
  config.enable_reloading = true

  # No carga todo el código al inicio (más rápido en desarrollo).
  config.eager_load = false

  # Muestra errores completos en el navegador.
  config.consider_all_requests_local = true

  # Habilita server timing.
  config.server_timing = true

  # Caché desactivado por defecto en desarrollo.
  config.action_controller.perform_caching = false
  config.cache_store = :null_store

  # -------------------------------------------------------
  # MÓDULOS COMENTADOS: fallan en este entorno (rbenv+rvm)
  # Se pueden reactivar cuando resuelvas el conflicto de versiones
  # -------------------------------------------------------

  # ActiveStorage — manejo de archivos subidos (no necesario para aprender backend básico)
  # config.active_storage.service = :local

  # ActionMailer — envío de correos
  # config.action_mailer.raise_delivery_errors = false
  # config.action_mailer.perform_caching = false

  # ActiveJob — trabajos en segundo plano
  # config.active_job.verbose_enqueue_logs = true

  # -------------------------------------------------------
  # CONFIGURACIONES QUE SÍ FUNCIONAN
  # -------------------------------------------------------

  # Deprecation warnings en el log (active_support sí carga bien)
  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []

  # Active Record (nuestra herramienta principal de aprendizaje)
  # Muestra error en pantalla si hay migraciones pendientes
  config.active_record.migration_error = :page_load

  # Muestra el SQL generado en los logs (MUY útil para aprender)
  config.active_record.verbose_query_logs = true

  # Suprime logs de assets para que el output sea más limpio
  config.assets.quiet = true

  # Lanza error si un before_action referencia una acción inexistente
  config.action_controller.raise_on_missing_callback_actions = true
end
