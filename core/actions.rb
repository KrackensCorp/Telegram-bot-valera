class Actions #класс управления действиями Валеры
  def initialize
    #создание файлов с конфигурацией каждого действия
    @yml = Stats.new.load('./core/actions.yml')
  end

  def param(valera)
    "
    \nЗдоровье = #{valera.health}
    \nМана = #{valera.mana}
    \nДеньги = #{valera.money}
    \nЖизнерадостность = #{valera.happiness}
    \nУсталость = #{valera.fatigue}\n
    \n
    "
  end

  def go_to_work(valera)
  valera.mana += @yml['go_to_work']['mana']
  valera.mana = 0 if valera.mana < 0
  valera.money += @yml['go_to_work']['money']
  valera.happiness += @yml['go_to_work']['happiness']
  valera.happiness = -10 if valera.happiness < -10
  valera.fatigue += @yml['go_to_work']['fatigue']
  valera.fatigue = 100 if valera.fatigue > 100

  File.open('./core/stats.yml', 'w') {  |file|
    file.puts("health: #{valera.health}")
    file.puts("mana: #{valera.mana}")
    file.puts("money: #{valera.money}")
    file.puts("happiness: #{valera.happiness}")
    file.puts("fatigue: #{valera.fatigue}")
  }
  end

  def look_nature(valera)
  valera.mana += @yml['look_nature']['mana']
  valera.mana = 0 if valera.mana < 0
  valera.happiness += @yml['look_nature']['happiness']
  valera.happiness = 10 if valera.happiness > 10
  valera.fatigue += @yml['look_nature']['fatigue']
  valera.fatigue = 100 if valera.fatigue > 100

  File.open('./core/stats.yml', 'w') {  |file|
    file.puts("health: #{valera.health}")
    file.puts("mana: #{valera.mana}")
    file.puts("money: #{valera.money}")
    file.puts("happiness: #{valera.happiness}")
    file.puts("fatigue: #{valera.fatigue}")
  }
  end

  def wine_and_tv(valera)
  valera.mana += @yml['wine_and_tv']['mana']
  valera.mana = 100 if valera.mana > 100
  valera.happiness += @yml['wine_and_tv']['happiness']
  valera.happiness = -10 if valera.happiness < -10
  valera.fatigue += @yml['wine_and_tv']['fatigue']
  valera.fatigue = 100 if valera.fatigue > 100
  valera.health += @yml['wine_and_tv']['health']
  if valera.health <= 0
    valera.health = 0
    valera.dead = 1
  end
  valera.money += @yml['wine_and_tv']['money']

  File.open('./core/stats.yml', 'w') {  |file|
    file.puts("health: #{valera.health}")
    file.puts("mana: #{valera.mana}")
    file.puts("money: #{valera.money}")
    file.puts("happiness: #{valera.happiness}")
    file.puts("fatigue: #{valera.fatigue}")
  }
  end

  def go_to_bar(valera)
  valera.mana += @yml['go_to_bar']['mana']
  valera.mana = 100 if valera.mana > 100
  valera.happiness += @yml['go_to_bar']['happiness']
  valera.happiness = 10 if valera.happiness > 10
  valera.fatigue += @yml['go_to_bar']['fatigue']
  valera.fatigue = 100 if valera.fatigue > 100
  valera.health += @yml['go_to_bar']['health']
  if valera.health <= 0
    valera.health = 0
    valera.dead = 1
  end
  valera.money += @yml['go_to_bar']['money']

  File.open('./core/stats.yml', 'w') {  |file|
    file.puts("health: #{valera.health}")
    file.puts("mana: #{valera.mana}")
    file.puts("money: #{valera.money}")
    file.puts("happiness: #{valera.happiness}")
    file.puts("fatigue: #{valera.fatigue}")
  }
  end

  def drinking_with_friends(valera)
  valera.mana += @yml['drinking_with_friends']['mana']
  valera.mana = 100 if valera.mana > 100
  valera.happiness += @yml['drinking_with_friends']['happiness']
  valera.happiness = 10 if valera.happiness > 10
  valera.fatigue += @yml['drinking_with_friends']['fatigue']
  valera.fatigue = 100 if valera.fatigue > 100
  valera.health += @yml['drinking_with_friends']['health']
  if valera.health <= 0
    valera.health = 0
    valera.dead = 1
  end
  valera.money += @yml['drinking_with_friends']['money']

  File.open('./core/stats.yml', 'w') {  |file|
    file.puts("health: #{valera.health}")
    file.puts("mana: #{valera.mana}")
    file.puts("money: #{valera.money}")
    file.puts("happiness: #{valera.happiness}")
    file.puts("fatigue: #{valera.fatigue}")
  }
  end

  def sing_in_subway(valera) #петь в метро
  if (valera.mana > 40 && valera.mana < 70)
    valera.money += @yml['sing_in_subway']['money1']
  else
    valera.money += @yml['sing_in_subway']['money2']
  end
  valera.mana += @yml['sing_in_subway']['mana']
  valera.mana = 100 if valera.mana > 100
  valera.happiness += @yml['sing_in_subway']['happiness']
  valera.happiness = 10 if valera.happiness > 10
  valera.fatigue += @yml['sing_in_subway']['fatigue']
  valera.fatigue = 100 if valera.fatigue > 100

  File.open('./core/stats.yml', 'w') {  |file|
    file.puts("health: #{valera.health}")
    file.puts("mana: #{valera.mana}")
    file.puts("money: #{valera.money}")
    file.puts("happiness: #{valera.happiness}")
    file.puts("fatigue: #{valera.fatigue}")
  }
  end

  def sleep(valera) #спать
  valera.health += @yml['sleep']['health'] if valera.mana < 30
  valera.health = 100 if valera.health > 100
  valera.mana += @yml['sleep']['mana']
  valera.mana = 0 if valera.mana < 0
  valera.happiness += @yml['sleep']['happiness'] if valera.mana > 70
  valera.happiness = -10 if valera.happiness < -10
  valera.fatigue += @yml['sleep']['fatigue']
  valera.fatigue = 0 if valera.fatigue < 0

  File.open('./core/stats.yml', 'w') {  |file|
    file.puts("health: #{valera.health}")
    file.puts("mana: #{valera.mana}")
    file.puts("money: #{valera.money}")
    file.puts("happiness: #{valera.happiness}")
    file.puts("fatigue: #{valera.fatigue}")
  }
  end

  def new_game(valera) # Начать новую игру
  File.open('./core/stats.yml', 'w') {  |file|
    file.puts("health: 100")
    file.puts("mana: 0")
    file.puts("money: 100")
    file.puts("happiness: 10")
    file.puts("fatigue: 0")
  }
  end
end
