require_relative '../score_accumulation'

describe ScoreAccumulation do
  it 'should accumulate the correct scores' do
    list1 = [{:name => "whatever", :val => 0.2}, {:name => "else", :val => 0.4}]
    list2 = [{:name => "whatever", :val => 0.5}, {:name => "else", :val => 0.3}, {:name => "nope", :val => 0.10}]
    id1 = "id1"
    id2 = "id2"

    joined_inversions = 
    {
      "whatever" => {
        "id1" => 0.2,
        "id2" => 0.5
      },
      "else" => {
        "id1" => 0.4,
        "id2" => 0.3
      },
      "nope" => {
        "id2" => 0.1
      }
    }

    given_id = "id1"
    given_keyword_list = list1.clone

    candidate_hash = 
      ScoreAccumulation.accumulate(given_id, given_keyword_list, joined_inversions, { "id1" => 0.4472135955, "id2" => 0.59160797831 })

    candidate_hash["id2"].should == 0.8315218406201678
    candidate_hash["id1"].should == nil
  end
end