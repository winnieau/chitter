require "spec_helper"

feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps page' do
    peep = Peep.new(content: 'Peep')
    peep.save
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Peep')
    end
  end
end
