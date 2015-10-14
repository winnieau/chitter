feature 'Deleting peeps' do
  scenario 'I can delete a peep' do
    visit '/'
    click_link 'Sign up'
    fill_in 'email', with: 'test@email.com'
    fill_in 'password', with: 'randomness'
    fill_in 'password_confirmation', with: 'randomness'
    click_button 'Sign up'
    visit '/peeps/new'
    fill_in 'content', with: 'Peep'
    click_button 'Peep'
    click_button "delete"
    expect(Peep.count).to eq 0
  end
end
