class Main
  module Listener
    # Этот module отвечает за стандартное сообщение
    module StandardMessages
      def process
        case Listener.message.text
        when '/start'
          Response.inline_message 'Привет, я Валера, что прикажешь?', Response.generate_inline_markup(
            [
              Inline_Button::PARAMS,
              Inline_Button::GO_TO_WORK,
              Inline_Button::LOOK_NATURE,
              Inline_Button::WINE_AND_TV,
              Inline_Button::GO_TO_BAR,
              Inline_Button::DRINKING_WITH_FRIENDS,
              Inline_Button::SING_IN_SUBWAY,
              Inline_Button::SLEEP,
              Inline_Button::NEW_GAME
            ]
          )
        else
          Response.std_message 'Первый раз такое слышу, попробуй другой текст'
        end
      end

      module_function(
        :process
      )
    end
  end
end
