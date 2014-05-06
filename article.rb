class Article
	attr_accessor :keywords 
	# [ 
	#   {:name => "whatever", :relevance => .09}, 
	#   {:name => "else", :relevance => .45} 
	# ]

	def keyword_names 
		@keywords.map { |k| k[:name] }
	end

	def keyword_values names 
		@keywords
		.select { |k| names.include?(k[:name]) }
		.map { |k| k[:relevance] }
	end

	def initialize (wordList, n)
		@keywords = []
		n.times do
			@keywords << {:name => wordList.sample, :relevance => rand.round(2)}
		end
	end



	def product other_article
		common_keywords = keyword_names & other_article.keyword_names
		
		print !common_keywords.empty? && common_keywords.inspect || "NOTHING!"
		print "\n"
		
		print keyword_values(common_keywords).inspect
		print "\t...\t"
		print other_article.keyword_values(common_keywords).inspect + "\n\n"
	end
end
