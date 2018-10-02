require "decent_exposure"

class TelegramController < Telegram::Bot::UpdatesController

  TELEGRAM_COMMAND_REGEXP = /^\/\w+ (.+)$/.freeze

  before_action :authorize_chat_id
  before_action :ensure_args_presence

  def start!
    reply_with :message, text: "toto truc cul"
  end

  def add_info!
    if @info.persisted?
      @info.body = body
    else
      @info.body += "\n\n#{body}"
    end

    reply_with :message, text: "The infos about #{tag} were successfully updated."
  end

  def clear_info!
    @info.destroy!
    reply_with :message, text: "All infos about #{tag} were successfully destroyed."
  end

  def info!
    reply_with :message, text: @info.body
  end

  private

  def authorize_chat_id
    head :forbidden unless self.payload['chat']['id'] == ENV['POKEDEX_CHAT_ID']
  end

  def ensure_args_presence
    head :bad_request unless tag && body
  end

  def command_args
    @command_args ||= self.payload["text"].match(TELEGRAM_COMMAND_REGEXP).try(:[], 1).try(:split, ' ')
  end

  def tag
    @tag ||= command_args.first
  end

  def body
    @body ||= command_args.last
  end

  def info
    @info ||= Info.where(tag: tag).first_or_initialize
  end

end
