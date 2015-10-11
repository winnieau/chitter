feature 'Deleting peeps' do
  before {Peep.create }
  scenario 'I can delete a peep' do
    visit '/peeps/new'
    fill_in 'content', with: 'Peep'
    click_button 'Peep'
    visit '/peeps'
  within 'ul#peeps' do
    expect(page).to have_content('Peep')
    click_link 'Undo'
      expect(Peep.count).to eq 0
    end
  end
end
