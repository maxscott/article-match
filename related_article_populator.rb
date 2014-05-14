module RelatedArticlePopulator
  def populate articles
    joined_inversions = IndexInverter.join_all articles
    puts "*** Created and Joined all Inversions ***"

    magnitudes = Similarity.all_magnitudes articles
    puts "*** Calculated Magnitudes ***"

    for i in 0..articles.length-1
      candidates = ScoreAccumulation.article_candidates articles[i], joined_inversions, magnitudes    
      article[i].related_articles = candidates.sort_by { |k,v| v }.reverse
    end
  end
end