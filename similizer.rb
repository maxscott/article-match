class Similizer
  def cosine_similarity arr_of_name_vals1, arr_of_name_vals2
    keywords1 = arr_of_name_vals1.clone
    keywords2 = arr_of_name_vals2.clone

    names1 = keywords1.map { |h| h[:name] }
    names2 = keywords2.map { |h| h[:name] }

    # for all words in A not in B, add them to B with val 0
    # and the opposite
    (names1 - names2).each { |word| keywords2 << {:name => word, :val => 0} }
    (names2 - names1).each { |word| keywords1 << {:name => word, :val => 0} }
    
    keywords1.sort! { |h1,h2| h1[:name] <=> h2[:name] }
    keywords2.sort! { |h1,h2| h1[:name] <=> h2[:name] }

    puts keywords1.inspect
    puts keywords2.inspect
    puts ""
    puts dot( keywords1.map { |h| h[:val] }, keywords2.map { |h| h[:val] } ) 
  end

  :private
  def dot v1, v2
  	sum = 0.0
    for i in 0..v1.count - 1
      sum += v1[i] * v2[i]
    end
    sum
  end
end

