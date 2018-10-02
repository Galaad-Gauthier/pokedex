module Telegram
  class BaseService

    TELEGRAM_COMMAND_REGEXP = /^\/\w+ (.+)$/.freeze

    attr_reader :payload, :tag, :body, :info, :text

    def initialize(payload)
      @payload = payload

      get_command_args
    end

    def valid?
      payload['chat']['id'] == ENV['POKEDEX_CHAT_ID'] &&
      tag.present?
    end

    private

    def info
      @info ||= Info.where(tag: tag).first_or_initialize
    end

    def get_command_args
      text           = payload['message']['text']
      matched_string = text.match(TELEGRAM_COMMAND_REGEXP).try(:[], 1)

      @tag, @body = matched_string.try(:split, ' ')
    end
  end
end
