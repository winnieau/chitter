module SessionHelpers
  def sign_in(user)
    visit '/sessions/new'
    expect(page).to have_content 'Please enter your email and password'
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Log in'
  end

  def sign_up(user)
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password_confirmation
    click_button 'Sign up'
  end
end
