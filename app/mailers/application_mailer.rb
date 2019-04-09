# Базовый класс для всех мэйлеров приложения
class ApplicationMailer < ActionMailer::Base
  # обратный адрес всех писем по умолчанию
  default from: "bbq@studyrails19.com"

  layout 'mailer'
end
