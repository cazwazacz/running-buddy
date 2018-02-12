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
