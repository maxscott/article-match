require_relative 'workflow'
require_relative 'similizer'
articles = Workflow.new.run

for i in 0..articles.count-1
  for j in i+1..articles.count-1
    
  end
end


Similizer.new.cosine_similarity articles[0].keywords, articles[1].keywords
