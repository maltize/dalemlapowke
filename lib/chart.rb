class Chart

  # "['what',count],['what2',count]"
  def self.data_by(what)
    # { what => count, what2 => count }
    h = Bribe.valids.count(:group => what, :order => 'COUNT(1) DESC')
    h.map{|k,v| "['#{what_title(what, k)}',#{v}]" }.join(',')
  end

  def self.what_title(what, id)
    obj = what.humanize.constantize.find(id)
    obj ? obj.title : ''
  end

end
