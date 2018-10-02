class Telegram::AddInfoService < Telegram::BaseService

  def call
    return false unless valid?

    upsert_info!
  end

  def valid?
    super && body.present?
  end

  private

  def upsert_info!
    info.body = [info.body, body].compact.join("\n\n")
    info.save!
  end

end
