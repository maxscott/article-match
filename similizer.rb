class Similizer
  def cosine_similarity keywords1, keywords2
    intersect_names = keywords1.map { |h| h[:name] } & keywords2.map { |h| h[:name] }

    match_vals1 = sorted_values_of_intersection( keywords1, intersect_names )
    match_vals2 = sorted_values_of_intersection( keywords2, intersect_names )

    dot( match_vals1, match_vals2 )
  end

  :private
  def sorted_values_of_intersection keywords, intersection_names
    keywords
      .select { |pair| intersection_names.any? { |name| name == pair[:name] } }
      .sort! { |h1,h2| h1[:name] <=> h2[:name] }
      .map { |h| h[:val] }
  end

  def dot v1, v2
  	sum = 0.0
    for i in 0..v1.count - 1
      sum += v1[i] * v2[i]
    end
    sum
  end
end