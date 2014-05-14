module ScoreAccumulation
  def self.article_candidates (article, inversions, magnitudes)
    accumulate(article.id, article.keywords, inversions, magnitudes)
  end

  def self.accumulate(id, keyword_list, inversion_index_hash, magnitudes)

    candidates = {}

    for i in 0..keyword_list.length - 1
      current_keyword = keyword_list[i]
      article_weights = inversion_index_hash[current_keyword[:name]]

      # would be faster to create lists and merge them
      article_weights.each do |k, v|
        next if k == id
        candidates[k] ||= 0
        candidates[k] += v * article_weights[id]
      end
    end

    candidates.each { |k,v| candidates[k] /= (magnitudes[k] * magnitudes[id]) } 

    candidates
  end
end