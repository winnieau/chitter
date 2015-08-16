require 'spec_helper'



describe Peep do
  let(:peep) {create :peep}
  it 'is a peep' do
    expect(peep.post).to eq 'First Peep Ever!'
  end
end
