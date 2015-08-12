require 'spec_helper'

feature 'I can sign up for Chitter' do
  scenario 'I can click a link which takes me to a signup page' do
    visit '/'
    click_link 'Sign Up'
    expect(current_path).to eq '/signup'
  end
  scenario 'I can sign up as a new user' do
    visit '/signup'
    expect(page).to have_content 'Join Chitter today.'
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, winnie1@example.com")
    expect(User.first.email).to eq("winnie1@example.com")
  end

  def sign_up(email: "winnie1@gmail.com", password: "chittering")
    visit "/signup/new_user"
    expect(page.status_code).to eq 200
    fill_in :email, with: email
    fill_in :password, with: password
    click_button "Sign up"
  end
end
