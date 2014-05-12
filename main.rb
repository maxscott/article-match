require_relative 'article_store'
require_relative 'index_inverter'
require_relative 'score_accumulation'
require_relative 'similarity'

articles = ArticleStore.new.run 10, 3
puts "*** Created Articles ***"

inverter = IndexInverter.new
inversions = articles.map { |a| inverter.invert a.keywords, a.id}
puts "*** Finished Inversions ***"

joined_inversions = inverter.join_all inversions
puts "*** Joined all Inversions ***"

magnitudes = Similarity.all_magnitudes articles
puts "*** Calculated Magnitudes ***"

for i in 0..articles.length-1
  candidates = ScoreAccumulation.article_candidates articles[i], joined_inversions, magnitudes
  puts "*** Article #{i}"
  puts articles[i].inspect
  puts "*** Candidates: "
  candidates.each { |k,v| 
    print v.round(2)
    print " => " 
    print articles.select { |a| a.id == k }.inspect
    print "\n"
  }
  puts "*** done ***"
end