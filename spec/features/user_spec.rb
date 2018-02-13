require 'rails_helper'

feature 'Signing up' do
  scenario 'Clicking sign up takes you to a new page with a form' do
    visit '/'
    click_link 'Sign up'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
    expect(page).to have_content 'Password confirmation'
  end

  scenario 'Signing up creates a logged in session' do
    sign_up('allan', 'allan@allan.com')
    expect(page).to have_content 'Logged in as allan@allan.com.'
  end

  scenario 'Cannot sign up with the same username twice' do
    sign_up('allan', 'allan@allan.com')
    sign_up('allan', 'tim@tim.com')
    expect(page).to have_content 'Username has already been taken'
  end

  scenario 'Cannot sign up with the same email twice' do
    sign_up('allan', 'allan@allan.com')
    sign_up('allan', 'allan@allan.com')
    expect(page).to have_content 'Email has already been taken'
  end
end

feature 'Logging in' do
  scenario 'Logging in takes you to the index page which has the user\'s email' do
    sign_up('allan', 'allan@allan.com')
    click_link 'Log in'
    fill_in 'username', with: 'allan'
    fill_in 'password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content 'Logged in as allan@allan.com.'
  end

  scenario 'Cannot log in if credentials are wrong' do
    sign_up('allan', 'allan@allan.com')
    click_link 'Log in'
    fill_in 'username', with: 'allan'
    fill_in 'password', with: '123423'
    click_button 'Log in'
    expect(page).to have_content 'Invalid username or password'
  end
end
