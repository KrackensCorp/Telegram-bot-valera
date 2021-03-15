class Main
  # This module assigned to creating InlineKeyboardButton
  module Inline_Button
    PARAMS = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Параметры', callback_data: 'params')
    GO_TO_WORK = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Пойти на работу', callback_data: 'go_to_work')
    LOOK_NATURE = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Созерцать природу',
                                                                 callback_data: 'look_nature')
    WINE_AND_TV = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Пить вино и смотреть сериал',
                                                                 callback_data: 'wine_and_tv')
    GO_TO_BAR = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Сходить в бар', callback_data: 'go_to_bar')
    DRINKING_WITH_FRIENDS = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Выпить с маргинальными личностями',
                                                                           callback_data: 'drinking_with_friends')
    SING_IN_SUBWAY = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Петь в метро',
                                                                    callback_data: 'sing_in_subway')
    SLEEP = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Спать', callback_data: 'sleep')
    NEW_GAME = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Сброс (Новая игра)', callback_data: 'new_game')

    GET_ACCOUNT = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Получить account', callback_data: 'get_account')
    HAVE_PROMO = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Есть промокод?', callback_data: 'force_promo')
    ADDITION_MENU = Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Ништяки', callback_data: 'advanced_menu')
  end
end
