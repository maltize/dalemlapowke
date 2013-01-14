class StaticRecord

  attr_accessor :id, :title

  def initialize(id, title)
    @id = id
    @title = title
  end

  def self.find(id)
    list[id] ? new(id, list[id]) : nil
  end

  def self.all
    list.map{|id, title| new(id, title)}
  end

  def self.list; {}; end

end
