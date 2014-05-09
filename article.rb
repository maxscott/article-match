class Article
    attr_accessor :keywords 
    # [ 
    #   {:name => "whatever", :val => .09}, 
    #   {:name => "else", :val => .45} 
    # ]

    def keyword_names 
    	@keywords.map { |k| k[:name] }
    end

    def keyword_values names 
    	@keywords
    	.select { |k| names.include?(k[:name]) }
    	.map { |k| k[:val] }
    end

    def initialize (wordList, n)
    	wordList = wordList.clone
        @keywords = []
    	n.times do
            word_sample = wordList.sample
    	    @keywords << {:name => word_sample, :val => rand.round(2)}
    	    wordList.delete word_sample 
        end
    end

    def similarity article
    	names = @keywords.map { |h| h[:name] }
        names2= article.keywords.map { |h| h[:name] }
        
        keywords_copy = @keywords.clone
        other_keywords_copy = article.keywords.clone

        # for all words in A not in B, add them to B with val 0
        # and the opposite
        (names - names2).each { |word| other_keywords_copy << {:name => word, :val => 0} }
        (names2 - names).each { |word| keywords_copy << {:name => word, :val => 0} }
        
        keywords_copy.sort! { |h1,h2| h1[:name] <=> h2[:name] }
        other_keywords_copy.sort! { |h1,h2| h1[:name] <=> h2[:name] }

        puts keywords_copy.inspect  
        puts other_keywords_copy.inspect

        puts ""
        vals = keywords_copy.map { |h| h[:val] }
        other_vals = other_keywords_copy.map { |h| h[:val] }

        puts vals.inspect
        puts other_vals.inspect

        puts ""

        sum = 0.0
        for i in 0..vals.count - 1
            sum += vals[i] * other_vals[i]
            puts "sum is now #{sum}"
        end
        puts sum
    end

    def compare other_article
    	common_keywords = keyword_names & other_article.keyword_names
    	
    	print !common_keywords.empty? && common_keywords.inspect || "NOTHING!"
    	print "\n"
    	
    	print keyword_values(common_keywords).inspect
    	print "\t...\t"
    	print other_article.keyword_values(common_keywords).inspect + "\n\n"
    end
end
