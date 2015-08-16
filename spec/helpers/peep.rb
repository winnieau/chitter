module PeepHelpers
  def post(peep)
    visit '/peeps/home'
    fill_in :peep, with: peep
    click_button 'Peep'
    expect(current_path).to eq '/peeps/home'
  end
end
