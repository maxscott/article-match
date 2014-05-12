module IndexInverter
  def self.join_all articles
    joined = {}
    articles.each do |a|
      a.keywords.each do |k|
        joined[k[:name]] ||= {}
        joined[k[:name]][a.id] = k[:val]
      end
    end
    joined
  end
end