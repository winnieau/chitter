feature 'Creating peeps' do
  scenario 'I can create a new peep' do
    visit '/'
    click_link 'Sign up'
    fill_in 'email', with: 'test@email.com'
    fill_in 'password', with: 'randomness'
    fill_in 'password_confirmation', with: 'randomness'
    click_button 'Sign up'
    visit '/peeps/new'
    fill_in 'content', with: 'Peep'
    click_button 'Peep'
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('Peep')
    end
  end
  scenario 'there are no peeps in the database at the start of the test' do
    expect(Peep.count).to eq 0
  end
end
