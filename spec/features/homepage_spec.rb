require 'rails_helper'
require_relative '../support/login_user'

feature 'homepage' do
  scenario 'user can enter username and select dialect at homepage' do
    visit('/')
    expect(page).to have_field('Username')
    expect(page).to have_select('Dialect')
  end

  scenario 'user can create account and access chat area' do
    LoginUser.new(username: 'new_test_user')
    @user = User.last
    expect(@user.username).to eq('new_test_user')
    expect(page).to have_css('#chat_area')
  end
end