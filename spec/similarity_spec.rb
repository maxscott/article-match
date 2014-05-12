require_relative '../similarity'

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
end