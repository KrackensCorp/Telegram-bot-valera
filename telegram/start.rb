require 'telegram/bot'
require './core/inline_button'
require './core/stats'
require './core/security'
require './core/actions'
require './core/listener'
require './core/response'
require './core/valera'
require './telegram/callback_messages'
require './telegram/standard_messages'
require './telegram/mac-shake'

# Entry point class
class Main
  def initialize
    super
    # Establishing webhook via @gem telegram/bot, using API-KEY
    Telegram::Bot::Client.run(TelegramOrientedInfo::API_KEY) do |bot|
      # Start time variable, for exclude message what was sends before bot starts
      start_bot_time = Time.now.to_i
      # Active socket listener
      bot.listen do |message|
        # Processing the new income message    #if that message sent after bot run.
        Listener.catch_new_message(message, bot) if Listener::Security.message_is_new(start_bot_time, message)
      end
    end
  end
end
# Bot start
Main.new
