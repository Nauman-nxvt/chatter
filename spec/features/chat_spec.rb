require 'rails_helper'
require_relative '../support/login_user'
require_relative '../support/browser_helper'

feature 'chat' do
  scenario 'user can see instant messaging chat div and input message textarea' do
      LoginUser.new(username: 'test_user123')
      expect(page).to have_css('#chat_area')
      expect(page).to have_css('#new_message')
    end

  scenario 'user can see currently active users on the chat page' do
    in_browser(:one) do
      LoginUser.new(username: 'test_user1')
    end
    in_browser(:two) do
      LoginUser.new(username: 'test_user2')
      expect(page).to have_content('test_user1')
      expect(page).to have_content('test_user2')
    end
  end

  scenario 'user can enter message and it should be visible to all active users on the chat page', js: true do
    in_browser(:one) do
      LoginUser.new(username: 'test_user11')
    end
    in_browser(:two) do
      LoginUser.new(username: 'test_user22')
    end
    in_browser(:one) do
      fill_in('Message', with: 'Hello everyone')
      click_on('Send!')
    end
    in_browser(:two) do
      expect(page).to have_content('Hello everyone')
    end

  end

end