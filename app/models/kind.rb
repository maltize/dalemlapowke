# encoding: UTF-8
class Kind < StaticRecord

  def self.list
    {
      1  => "Dałem łapówkę",
      2  => "Nie dałem łapówki",
      3  => "Przyjąłem łapówkę",
      4  => "Nie przyjęto mojej łapówki"
    }
  end

end
