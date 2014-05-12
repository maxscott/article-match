require_relative 'article_store'
require_relative 'index_inverter'
require_relative 'score_accumulation'
require_relative 'similarity'
require_relative 'related_article_populator'

articles = # Get from mongo aka the contract

RelatedArticlePopulator.populate(articles)