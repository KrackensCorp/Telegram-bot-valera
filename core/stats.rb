require 'yaml'

class Stats #класс для работы с файлами YAML
  def load(filename) #загрузка из файла параметров Валеры
    YAML::load(File.read(filename))
  end
end
