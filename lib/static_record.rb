class StaticRecord

  attr_accessor :id, :title

  def initialize(id, title)
    @id = id
    @title = title
  end

  def self.find(id)
    _id = id.to_i
    list[_id] ? new(_id, list[_id]) : nil
  end

  def self.all
    list.map{|id, title| new(id, title)}
  end

  def self.list; {}; end

  def self.options
    all.map{|record| [record.title, record.id] }
  end

end
