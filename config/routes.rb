Rails.application.routes.draw do

  telegram_webhook TelegramController, default: :start!

end
