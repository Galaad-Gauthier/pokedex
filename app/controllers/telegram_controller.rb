class TelegramController < Telegram::Bot::UpdatesController

  before_action :get_tag

  def start!
    reply_with :message, text: "toto truc cul"
  end

  def add_info!
    reply_with :message, text: payload.inspect
  end

  def clear_info!

  end

  def info!
    reply_with :message, text: response
  end

  private

  def get_tag
    @tag = ''
  end

  def payload
    @payload ||= self.payload
  end
end
