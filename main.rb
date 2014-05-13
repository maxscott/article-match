require_relative 'article_store'
require_relative 'index_inverter'
require_relative 'score_accumulation'
require_relative 'similarity'

print "*** Creating Articles..."
articles = ArticleStore.new.run 700, 10
puts "done ***"

print "*** Joining inversions ..."
joined_inversions = IndexInverter.join_all articles
puts "done ***"

print "*** Calculating magnitudes ..."
magnitudes = Similarity.all_magnitudes articles
puts "done ***"

print "*** Scoring ..."
for i in 0..articles.length-1
  puts "#{i}..." if i % 100 == 0
  candidates = ScoreAccumulation.article_candidates articles[i], joined_inversions, magnitudes
end
puts "*** finished ***"