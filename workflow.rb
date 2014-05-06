require_relative 'article'
require_relative 'word_reader'
require_relative 'article_factory'

class Workflow
	NO_OF_ARTICLES = 3
	NO_OF_WORDS = 5

	attr_accessor :articles

	def run
		words = WordReader.new.run
		ArticleFactory.new.run(words, NO_OF_WORDS, NO_OF_ARTICLES)
	end
end