require_relative '../index_inverter'
require_relative '../article' #yea not great

describe IndexInverter do
  it 'should invert index articles' do
    article1 = Article.new
    article2 = Article.new
    article1.keywords = [{:name => "meow", :val => 0.5}, {:name => "go", :val => 0.2}]
    article2.keywords = [{:name => "gofer", :val => 0.1}, {:name => "go", :val => 0.6}]
    article1.id = id1 = "id1"
    article2.id = id2 = "id2"

    joined_inversions = IndexInverter.join_all [article1, article2]

    joined_inversions["meow"].count.should == 1
    joined_inversions["meow"][id1].should == 0.5

    joined_inversions["go"].count.should == 2
    joined_inversions["go"][id1].should == 0.2
    joined_inversions["go"][id2].should == 0.6

    joined_inversions["gofer"].count.should == 1
    joined_inversions["gofer"][id2].should == 0.1    
  end
end