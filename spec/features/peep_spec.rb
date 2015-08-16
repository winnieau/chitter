require 'spec_helper'

feature 'user can visit page of own peeps' do
  scenario 'and write peep on own peep page' do
    visit '/peeps/home'
    peep = build :peep
    expect {post(create :peep)}.to change(Peep, :count).by(1)
    expect(Peep.count).to eq 1
  end
end
