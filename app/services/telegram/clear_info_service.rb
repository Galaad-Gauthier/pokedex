class Telegram::ClearInfoService < Telegram::BaseService

  def call
    return false unless valid?

    info.destroy!
  end

end
