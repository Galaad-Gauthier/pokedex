class TelegramController < Telegram::Bot::UpdatesController

  before_action { @payload ||= self.payload }

  before_action do
    Info.create(tag: params[:action], body: payload.inspect)
  end

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

end
