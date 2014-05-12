module ScoreAccumulation
  def self.article_candidates (article, inversions, magnitudes)
    accumulate(article.id, article.keywords, inversions, magnitudes)
  end

  def self.accumulate(document_id, keyword_list, inversion_index_hash, magnitudes)

    candidates = {}

    for i in 0..keyword_list.length - 1
      current_keyword = keyword_list[i]
      temp_article_key_weights = inversion_index_hash[current_keyword[:name]]

      # would be faster to create all these lists seperately then merge/aggregate
      # init, 
      # remove bottom half of cosine similarity, 
      # update dotproduct
      # add back the magnitudes piece
      temp_article_key_weights.each do |k, v|
        next if k == document_id
        candidates[k] ||= 0
        candidates[k] += v * temp_article_key_weights[document_id]
      end
    end

    candidates.each { |k,v| candidates[k] /= (magnitudes[k] * magnitudes[document_id]) } 

    candidates
  end
end