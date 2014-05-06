require_relative 'workflow'

articles = Workflow.new.run

articles.each do |a| 
	articles.each do |b| 
		a.product b unless a == b
	end	
end