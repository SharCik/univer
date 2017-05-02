require 'telegram/bot'

class TelegramBotWorker
  include Sidekiq::Worker

  TOKEN   = '284079359:AAHDvhzytIlC9Mk0yE6eRB0MoQvwFi9dHOA'
  CHANNEL = '191554053'

  def perform_async(message)
    Telegram::Bot::Client.run(TOKEN) do |bot|
      bot.api.send_message(chat_id: CHANNEL, text: message)
    end
  end
end
