require_relative 'article_store'
require_relative 'index_inverter'

articles = ArticleStore.new.run 50, 3
puts "*** Created Articles ***"

inverter = IndexInverter.new
inversions = articles.map { |a| inverter.invert a.keywords, a.id}
puts "*** Finished Inversions ***"

joined = {}
for i in 0..articles.count-1 do
  joined = inverter.join(joined, inversions[i])
end
puts "*** Joined all Inversions ***"

puts joined.inspect