require_relative 'workflow'
require_relative 'similizer'
articles = Workflow.new.run

articles.each do |a| 
	articles.each do |b| 
		#a.compare b unless a == b
	end	
end

Similizer.new.cosine_similarity articles[0].keywords, articles[1].keywords
