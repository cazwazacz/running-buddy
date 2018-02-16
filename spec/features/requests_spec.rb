require 'rails_helper'

feature 'Requests' do
  scenario 'a user can see that their request has been sent' do
    two_users_sign_up_and_log_in
    expect(page).to have_content 'john Run with me!'
    click_button 'Run with me!'
    expect(page).to have_content 'john Request sent'
    visit '/'
    expect(page).to have_content 'john Request sent'
  end

  scenario 'a user can see that they have a notification' do
    two_users_sign_up_and_log_in(true)
    expect(page).to have_content 'Notifications (1)'
  end

  scenario 'a user can see the requests they have sent and received' do
    two_users_sign_up_and_log_in(true)
    click_button 'Run with me!'
    click_link 'Notifications (1)'
    expect(page).to have_content 'Received'
    expect(page).to have_content 'Pending'
    expect(page).to have_content 'john'
    expect(page).to have_content 'Accepted'
    expect(page).to have_content 'Sent'
    expect(page).to have_content 'john'
  end

  scenario 'a user that is not signed in cannot visit /requests' do
    visit '/requests'
    expect(page).to have_content 'You must be signed in to view this page.'
  end
end
