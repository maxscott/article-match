class Article
  attr_accessor :keywords, :related_articles
  attr_reader :id
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

  def initialize (wordList = nil, words = 0, id = 0)
    @related_articles = []
    @id = id
    wordList = wordList.clone unless wordList == nil
    @keywords = []
    words.times do
      word_sample = wordList.sample
      @keywords << {:name => word_sample, :val => rand.round(2)}
      wordList.delete word_sample 
    end
  end
end
