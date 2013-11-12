require 'data_mapper'
require 'score'

describe Score do
 
  let(:score) { Score.new }

  it 'can log a winner' do
  	expect(score).to respond_to :winner=
  end

  it 'can log a loser' do
  	expect(score).to respond_to :loser=
  end

end