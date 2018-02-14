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
    visit '/'
    expect(page).to have_content 'john Request sent'
  end

  scenario 'a user can see that they have a notification' do
    sign_up('allan', 'allan@allan.com')
    click_link 'Log out'
    sign_up('john', 'john@john.com')
    click_button 'Run with me!'
    click_link 'Log out'
    click_link 'Log in'
    fill_in 'username', with: 'allan'
    fill_in 'password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content 'Notifications (1)'
  end

  scenario 'a user can see the requests they have sent and received' do
    sign_up('allan', 'allan@allan.com')
    click_link 'Log out'
    sign_up('john', 'john@john.com')
    click_button 'Run with me!'
    click_link 'Log out'
    click_link 'Log in'
    fill_in 'username', with: 'allan'
    fill_in 'password', with: '123456'
    click_button 'Log in'
    click_button 'Run with me!'
    click_link 'Notifications (1)'
    expect(page).to have_content 'Received'
    expect(page).to have_content 'john'
    expect(page).to have_content 'Sent'
    expect(page).to have_content 'john'
  end
end
