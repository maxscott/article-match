require_relative '../article'

describe Article do
  it 'should not explode on new' do
    Article.new
  end

  it 'should set some keywords uniquely' do
    a = Article.new %w(meow words whocares theres enough now), 4
    a.keyword_names.uniq.count.should == 4
    a.keyword_values.count.should == 4
  end

  it 'should set values between 0 and 1' do
    a = Article.new %w(meow words whocares theres enough now), 4
    puts a.keyword_values.inspect
    a.keyword_values.each do |value| 
      value.should satisfy { |v| v >= 0 }
      value.should satisfy { |v| v <= 1 }
    end
  end
end