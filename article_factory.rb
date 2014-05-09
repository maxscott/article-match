class ArticleFactory
    def run (words, number_of_words, number_of_articles)
    	@articles = []
    	(1..number_of_articles).each do |n|
    		@articles << Article.new(words, number_of_words)
    	end
    	@articles
    end
end
