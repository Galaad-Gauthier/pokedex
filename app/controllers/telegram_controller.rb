class TelegramController < Telegram::Bot::UpdatesController

  def start!
    reply_with :message, text: "Oui bonjour."
  end

  def add_info!(tag, *body)
    service = Telegram::AddInfoService.new(chat_id, tag, body)

    if service.call
      reply_with :message, text: "The info about #{tag} was successfully updated."
    else
      reply_with :message, text: "Nope."
    end
  end

  def clear_info!(tag)
    service = Telegram::ClearInfoService.new(chat_id, tag)

    if service.call
      reply_with :message, text: "All info about #{tag} was successfully destroyed."
    else
      reply_with :message, text: "Nope."
    end
  end

  def info!(tag)
    service = Telegram::GetInfoService.new(chat_id, tag)
    info_body = service.call

    if info_body
      reply_with :message, text: info_body
    else
      reply_with :message, text: "Nope."
    end
  end

  private

  def chat_id
    @chat_id = self.payload['chat']['id']
  end

end
