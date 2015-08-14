require 'spec_helper'


feature 'User sign up' do
  context 'can sign up' do
    scenario 'I can click a New User link which takes me to a signup page' do
      visit '/'
      click_link 'New User'
      expect(current_path).to eq '/users/new'
    end
    scenario 'I can sign up as a new user' do
      expect  { sign_up(email: 'winnie@example.com', password: 'apples', password_confirmation: 'apples') }.to change(User, :count).by(1)
      expect(page).to have_content('Welcome, winnie@example.com')
      expect(User.first.email).to eq('winnie@example.com')
    end
  end
  context 'user can not sign up' do
    scenario 'with a password that does not match' do
      expect { sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
      expect(current_path).to eq '/users'
      expect(page).to have_content 'Password and confirmation password do not match'
    end
  end

  def sign_up(email: 'winnie@example.com',
        password: 'apples',
              password_confirmation: 'apples')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end
end
