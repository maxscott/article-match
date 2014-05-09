class Article
  attr_accessor :keywords, :related_articles
  # [ 
  #   {:name => "whatever", :val => .09}, 
  #   {:name => "else", :val => .45} 
  # ]

  def keyword_names 
    @keywords.map { |k| k[:name] }
  end

  def keyword_values 
    @keywords.map { |k| k[:val] }
  end

  def initialize (wordList = [], n = 0)
    @related_articles = []
    wordList = wordList.clone
    @keywords = []
    n.times do
      word_sample = wordList.sample
      @keywords << {:name => word_sample, :val => rand.round(2)}
      wordList.delete word_sample 
    end
  end
end
