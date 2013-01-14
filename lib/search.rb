class Search

  # TODO Rewrite to something better
  def self.find(query)
    Bribe.valid.
      where("subject LIKE ? OR description LIKE ?",
        "%#{query}%", "%#{query}%").
      order("created_at DESC")
  end

end
