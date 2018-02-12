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
    visit '/'
    click_link 'Sign up'
    fill_in 'user[email]', with: 'allan@allan.com'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    click_button 'Create User'
    expect(page).to have_content 'Signed up!'
  end
end
