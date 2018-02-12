def sign_up(username, email)
  visit '/'
  click_link 'Sign up'
  fill_in 'user[username]', with: username
  fill_in 'user[email]', with: email
  fill_in 'user[password]', with: '123456'
  fill_in 'user[password_confirmation]', with: '123456'
  click_button 'Create User'
end
