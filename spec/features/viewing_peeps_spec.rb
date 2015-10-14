require "spec_helper"

feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps page' do
    visit '/'
    click_link 'Sign up'
    fill_in 'email', with: 'test@email.com'
    fill_in 'password', with: 'randomness'
    fill_in 'password_confirmation', with: 'randomness'
    click_button 'Sign up'
    peep = Peep.new(content: 'Peep', user: User.last)
    peep.save
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Peep')
    end
  end
end
