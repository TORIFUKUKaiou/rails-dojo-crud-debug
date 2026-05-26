# GitHub Codespaces で開発するための緩和設定（開発用）
if Rails.env.development?
  Rails.application.configure do
    config.hosts << /.*\.github\.dev/
    config.action_controller.forgery_protection_origin_check = false

    if defined?(WebConsole)
      config.web_console.permissions = "0.0.0.0/0"
    end
  end
end
