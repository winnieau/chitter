module PeepHelpers
  def post(peep)
    visit '/peeps/home'
    expect(page.status_code).to eq 200
    fill_in :peep, with: peep.content
    click_button 'Peep'

  end
end
