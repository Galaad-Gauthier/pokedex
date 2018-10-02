class Telegram::GetInfoService < Telegram::BaseService

  def call
    return false unless valid?

    info.body
  end

end
