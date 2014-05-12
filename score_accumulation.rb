module ScoreAccumulation
  def self.accumulate(document_id, keyword_list, inversion_index_hash, magnitudes)

    candidates = {}

    for i in 0..keyword_list.length - 1
      current_keyword = keyword_list[i]

      temp_article_key_weights = inversion_index_hash[current_keyword[:name]].clone
      current_keyword_weight = temp_article_key_weights.delete(document_id)
      
      # would be faster to create all these lists seperately then merge/aggregate
      # init, 
      # remove bottom half of cosine similarity, 
      # update dotproduct
      # add back the magnitudes piece
      temp_article_key_weights.each do |k, v|
        candidates[k] ||= 0
        candidates[k] *= (magnitudes[k] * magnitudes[document_id])
        candidates[k] += v * current_keyword_weight
        candidates[k] /= (magnitudes[k] * magnitudes[document_id])
      end
    end

    candidates
  end
end