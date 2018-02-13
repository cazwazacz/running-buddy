require 'rails_helper'

feature 'Requests' do
  scenario 'a user can see that their request has been sent' do
    sign_up('allan', 'allan@allan.com')
    click_link 'Log out'
    sign_up('john', 'john@john.com')
    click_link 'Log out'
    click_link 'Log in'
    fill_in 'username', with: 'allan'
    fill_in 'password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content 'john Run with me!'
    click_button 'Run with me!'
    expect(page).to have_content 'john Request sent'
  end
end
