require 'spec_helper'

feature 'user can visit page of own peeps' do
  scenario 'if user is logged in' do
    visit '/peeps/home'
    peep = Peep.create
    expect {post(peep)}.to change(Peep, :count).by(1)
    expect(Peep.count).to eq 1
  end
end
