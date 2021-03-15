require 'yaml'

class Main
  module Listener
    # This module assigned to processing all callback messages
    module CallbackMessages
      attr_accessor :callback_message

      def process
        stat = Stats.new
        yml = stat.load('./core/stats.yml')
        valera = Valera.new({ health: yml['health'], mana: yml['mana'], money: yml['money'], happiness: yml['happiness'], fatigue: yml['fatigue'], dead: 0 })

        action = Actions.new
        self.callback_message = Listener.message.message
        case Listener.message.data

        when 'params'
          Listener::Response.std_message('Параметры')
          Listener::Response.std_message(action.param(valera))

        when 'go_to_work'
          if valera.mana > 50 || valera.fatigue > 10
            Listener::Response.std_message('Валера не пошел на работу, он либо пьян, либо устал, неважно...')
          else
            action.go_to_work(valera)
            Listener::Response.std_message('Сходил на работу.')
          end

        when 'look_nature'
          action.look_nature(valera)
          Listener::Response.std_message('Сходил в парк. Немного устал.')

        when 'wine_and_tv'
          if valera.money < 20
            Listener::Response.std_message('Недостаточно денег')
          else
            action.wine_and_tv(valera)
            Listener::Response.std_message('Валера открыл бутылку вина и посмотрел новую серию сериала')
          end

        when 'go_to_bar'
          if valera.money < 100
            Listener::Response.std_message('Недостаточно денег')
          else
            action.go_to_bar(valera)
            Listener::Response.std_message('Сходил в бар')
          end

        when 'drinking_with_friends'
          if valera.money < 150
            Listener::Response.std_message('Недостаточно денег')
          else
            action.drinking_with_friends(valera)
            Listener::Response.std_message('Выпил с друзьями')
          end

        when 'sing_in_subway'
          if valera.mana > 40 && valera.mana < 70
            Listener::Response.std_message('Пел в метро в меру пьяный, заработал денег')
          else
            Listener::Response.std_message('Пел в метро, заработал гроши')
          end
          action.sing_in_subway(valera)

        when 'sleep'
          if valera.mana < 30
            Listener::Response.std_message('Поспал')
          else
            Listener::Response.std_message('Поспал, ночью было плохо')
          end
          action.sleep(valera)

        when 'new_game'
          action.new_game(valera)
          Listener::Response.std_message('Параметры сброшены, новый Валера создан')

        else
          Listener::Response.std_message('Ты как сюда попал?!')
        end

        Response.inline_message 'Что дальше?', Response.generate_inline_markup(
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
      end

      module_function(
        :process,
        :callback_message,
        :callback_message=
      )
    end
  end
end
