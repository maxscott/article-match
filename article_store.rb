require_relative 'article'
require_relative 'word_reader'
require_relative 'article_factory'

class ArticleStore
	NO_OF_ARTICLES = 3
	NO_OF_WORDS = 5

	attr_accessor :articles

	def run no_of_articles = NO_OF_ARTICLES, no_of_words = NO_OF_WORDS
		word_list = WordReader.new.run
		ArticleFactory.new.run(word_list, no_of_words, no_of_articles)
	end
end