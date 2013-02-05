require 'models/spec_helper'

describe GameStatus do
  it { should have_field(:state) }
  it { should have_field(:num) }

  it 'not valid if state not in allow_state' do
    expect(GameStatus.new(:state => 'foo')).to_not be_valid
  end

  it 'valid with state in allow_state' do
    expect(GameStatus.new(:state => GameStatus.allow_state.first)).to be_valid
  end

end
