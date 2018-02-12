require 'rails_helper'

feature 'testing infrastructure' do
  scenario 'index page says Running Buddy' do
    visit '/'
    expect(page).to have_content("Running Buddy")
  end

  scenario 'clicking button changes text' do
    visit '/'
    find('#change-button').click
    expect(page).to have_content("wazap")
  end
end
