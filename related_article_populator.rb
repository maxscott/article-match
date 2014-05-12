module RelatedArticlePopulator
  def populateREAL articles 
    inverter = IndexInverter.new
    inversions = articles.map { |a| inverter.invert a.keywords, a.id}
    puts "*** Finished Inversions ***"

    joined_inversions = inverter.join_all inversions
    puts "*** Joined all Inversions ***"

    magnitudes = Similarity.all_magnitudes articles
    puts "*** Calculated Magnitudes ***"

    for i in 0..articles.length-1
      candidates = ScoreAccumulation.article_candidates articles[i], joined_inversions, magnitudes    
      article[i].related_articles = candidates.sort_by { |k,v| v }
    end
  end

  def populate articles
    puts "... is this thing on? #{articles.count} articles loaded. First looks like this: "
    puts articles[i].inspect
  end
end