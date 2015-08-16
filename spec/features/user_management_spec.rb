require 'spec_helper'


feature 'User sign up' do
  context 'can sign up' do
    scenario 'I can click a New User link which takes me to a signup page' do
      visit '/'
      click_link 'New User'
      expect(current_path).to eq '/users/new'
    end
    scenario 'I can sign up as a new user' do
      user = build :user
      expect  { sign_up(user)}.to change(User, :count).by(1)
      expect(page).to have_content('Welcome, winnie@example.com')
      expect(User.first.email).to eq('winnie@example.com')
    end
  end
  context 'user can not sign up' do
    scenario 'with a password that does not match' do
      user = build :user, password: 'something else'
      expect { sign_up(user)}.not_to change(User, :count)
      expect(current_path).to eq '/users'
      expect(page).to have_content 'Password and confirmation password do not match'
    end
    scenario 'without a valid email' do
      user = build :user, email: ''
      expect{ sign_up(user)}.not_to change(User, :count)
      expect(current_path).to eq '/users'
      expect(page).to have_content 'Please enter a valid email address'
    end
    scenario 'with existing email' do
      user = create :user
      expect{ sign_up(user) }.not_to change(User, :count)
      expect(current_path).to eq '/users'
      expect(page).to have_content 'Email already registered'
    end
  end
  feature 'user sign in' do
    let(:user) { create :user }
    context 'user signs in' do
      scenario 'with correct credentials' do
        sign_in(password: user.password, email: user.email)
        expect(current_path).to eq '/'
        expect(page).to have_content "Welcome, #{user.email}"
      end
    end
    context 'user cannot sign in' do
      scenario 'with wrong password' do
        sign_in(email: user.email, password: !user.password)
        expect(current_path).to eq '/sessions'
        expect(page).to have_content 'Email or password incorrect'
      end
    end
  end

  feature 'user sign out' do
    let(:user) { create :user }
    scenario 'can sign out' do
      sign_in(email: user.email, password: user.password)
      click_button 'Sign out'
      expect(current_path).to eq '/'
      expect(page).not_to have_content "Welcome, #{user.email}"
    end
  end
end
