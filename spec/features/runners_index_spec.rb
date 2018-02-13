require 'rails_helper'

feature 'Runners index page' do
  scenario 'can see all signed up runners' do
    sign_up('allan', 'allan@allan.com')
    sign_up('john', 'john@john.com')
    sign_up('tim', 'tim@tim.com')
    click_link 'Log in'
    fill_in 'username', with: 'allan'
    fill_in 'password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content 'john Run with me!'
    expect(page).to have_content 'tim Run with me!'
  end
end
