class TelegramController < Telegram::Bot::UpdatesController

  def start!
    reply_with :message, text: "Oui bonjour."
  end

  def add_info!
    service = Telegram::AddInfoService.new(self.payload)

    if service.call
      reply_with :message, text: "The info about #{service.tag} was successfully updated."
    else
      reply_with :message, text: "Nope."
    end
  end

  def clear_info!
    service = Telegram::ClearInfoService.new(self.payload)

    if service.call
      reply_with :message, text: "All info about #{service.tag} was successfully destroyed."
    else
      reply_with :message, text: "Nope."
    end
  end

  def info!
    service = Telegram::GetInfoService.new(self.payload)
    info_body = service.call

    if info_body
      reply_with :message, text: info_body
    else
      reply_with :message, text: "Nope."
    end
  end

end
