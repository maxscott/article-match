require_relative 'article_store'
require_relative 'index_inverter'

articles = ArticleStore.new.run 50, 3
puts "*** Created Articles ***"

inverter = IndexInverter.new
inversions = articles.map { |a| inverter.invert a.keywords, a.id}
puts "*** Finished Inversions ***"

joined = {}
for i in 0..inversions.count-1 do
  joined = inverter.join(joined, inversions[i])
end
puts "*** Joined all Inversions ***"


articles.each do |a|
  lists_to_merge = a.keywords.map do |w|
    lw = joined[w].clone
    mw = lw.remove(a.id)
    lw.map! { |weight| weight * mw }
    lw
  end

  ptrs = []
  lists_to_merge.count.times { ptrs << 0 }

end


