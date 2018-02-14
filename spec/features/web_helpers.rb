def sign_up(username, email)
  visit '/'
  click_link 'Sign up'
  fill_in 'user[username]', with: username
  fill_in 'user[email]', with: email
  fill_in 'user[password]', with: '123456'
  fill_in 'user[password_confirmation]', with: '123456'
  click_button 'Create User'
end

def two_users_sign_up_and_log_in(request = false)
  sign_up('allan', 'allan@allan.com')
  click_link 'Log out'
  sign_up('john', 'john@john.com')
  click_button 'Run with me!' if request
  click_link 'Log out'
  click_link 'Log in'
  fill_in 'username', with: 'allan'
  fill_in 'password', with: '123456'
  click_button 'Log in'
end
