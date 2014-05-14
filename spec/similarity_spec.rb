require_relative '../similarity'
require_relative '../article'

describe Similarity do
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