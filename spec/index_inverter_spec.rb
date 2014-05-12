require_relative '../index_inverter'

describe IndexInverter do
  it 'should not explode on new' do
    IndexInverter.new
  end

  it 'should invert the keyword list' do
    keywords = [{:name => "meow", :val => 0.5}, {:name => "go", :val => 0.2}]
    parent_id = 1

    inversion = IndexInverter.new.invert keywords, parent_id

    inversion["meow"][parent_id].should == 0.5
    inversion["go"][parent_id].should == 0.2
  end

  it 'should join two inversions properly' do
    keywords1 = [{:name => "meow", :val => 0.5}, {:name => "go", :val => 0.2}]
    keywords2 = [{:name => "gofer", :val => 0.1}, {:name => "go", :val => 0.6}]
    id1 = "id1"
    id2 = "id2"
    inversion1 = IndexInverter.new.invert keywords1, id1
    inversion2 = IndexInverter.new.invert keywords2, id2

    joined_inversions = IndexInverter.new.join inversion1, inversion2

    joined_inversions["meow"].count.should == 1
    joined_inversions["meow"][id1].should == 0.5

    joined_inversions["go"].count.should == 2
    joined_inversions["go"][id1].should == 0.2
    joined_inversions["go"][id2].should == 0.6

    joined_inversions["gofer"].count.should == 1
    joined_inversions["gofer"][id2].should == 0.1    
  end
end