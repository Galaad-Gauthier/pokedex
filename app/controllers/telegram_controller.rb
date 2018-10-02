class TelegramController < Telegram::Bot::UpdatesController

  before_action :get_tag

  def start!
    response_with :message, text: "toto truc cul"
  end

  def start
    response_with :message, text: "toto truc cul 12"
  end

  def add_info!
    response_with :message, text: payload.inspect
  end

  def clear_info!

  end

  def info!

    respond_with :message, text: response
  end

  private

  def get_tag
    @tag = ''
  end

  def payload
    @payload ||= self.payload
  end
end
