require_relative 'rails_helper'
require_relative './../core/actions'
require File.expand_path('../config/environment', __dir__)

RSpec.describe ActionManager do
  a = Actions.new
  mng = described_class.new(a)

  describe do
    context 'Checking param text' do
      stat = Stats.new
      yml = stat.load('./core/stats.yml')
      it "should say 'Hello World' when we call the say_hello method" do
        message = a.param(Valera.new({ health: yml['health'], mana: yml['mana'], money: yml['money'], happiness: yml['happiness'], fatigue: yml['fatigue'], dead: 0 }))

        expect(message).to eq "health: 100
mana: 0
money: 100
happiness: 10
fatigue: 0"
      end
    end
  end
end
