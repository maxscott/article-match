class ArticleFactory
    def run (word_list, number_of_words, number_of_articles)
    	@articles = []
    	(1..number_of_articles).each do |n|
    		@articles << Article.new(word_list, number_of_words, n)
    	end
    	@articles
    end
end
