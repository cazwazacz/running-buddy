require 'rails_helper'

feature 'Signing up' do
  scenario 'Clicking sign up takes you to a new page with a form' do
    visit '/'
    click_link 'Sign up'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
    expect(page).to have_content 'Password confirmation'
  end

  scenario 'Signing up works' do
    sign_up
    expect(page).to have_content 'Signed up!'
  end
end

feature 'Logging in' do
  scenario 'Logging in takes you to the index page which has the user\'s email' do
    sign_up
    click_link 'Log in'
    fill_in 'email', with: 'allan@allan.com'
    fill_in 'password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content 'Logged in as allan@allan.com.'
  end
end
