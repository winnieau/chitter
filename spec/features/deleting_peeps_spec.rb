feature 'Deleting peeps' do
  scenario 'I can delete a peep' do
  visit '/peeps/new'
  fill_in 'content', with: 'Peep'
  click_button 'Peep'
    expect(page).to have_content('Peep')
    click_button "delete"
    expect(Peep.count).to eq 0
  end
end
