require_relative '../similarity'
require_relative '../article'

describe Similarity do
  it 'should do the dot product' do
    Similarity.dot( [1, 2, 3], [2, 3, 4] ).should == 20
  end

  it 'should do cosine similarity' do
    list1 = [{:name => "whatever", :val => 0.2}, {:name => "else", :val => 0.4}]
    list2 = [{:name => "whatever", :val => 0.5}, {:name => "else", :val => 0.3}, {:name => "nope", :val => 0.10}]
    Similarity.cosine(list1, list2).round(5).should == 0.84366
  end

  it 'should be able to calculate magnitude' do
    v = [1, 2, 3, 4]
    Similarity.magnitude(v).should == Math.sqrt(30)
  end

  it 'should be able to calculate all magnitudes' do
    article1 = Article.new
    article2 = Article.new
    article1.keywords = [{:name => "whatever", :val => 0.2}, {:name => "else", :val => 0.4}]
    article1.id = 1
    article2.keywords = [{:name => "whatever", :val => 0.2}, {:name => "else", :val => 0.7}]
    article2.id = 2

    all_mag = Similarity.all_magnitudes([article1, article2])
    all_mag[1].round(4).should == Math.sqrt(0.2).round(4)
    all_mag[2].round(4).should == Math.sqrt(0.53).round(4)
  end

  it 'should be able to calculate magnitude' do
    v = [1, 2, 3, 4]
    Similarity.magnitude(v).should == Math.sqrt(30)
  end
end