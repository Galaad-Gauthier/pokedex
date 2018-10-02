module Telegram
  class BaseService

    attr_reader :chat_id, :tag, :body, :info

    def initialize(chat_id, tag, body=[])
      @tag     = tag
      @body    = body.join(' ')
      @chat_id = chat_id
    end

    def valid?
      chat_id.to_s == ENV['POKEDEX_CHAT_ID'] &&
      tag.present?
    end

    private

    def info
      @info ||= Info.where(tag: tag).first_or_initialize
    end

  end
end
