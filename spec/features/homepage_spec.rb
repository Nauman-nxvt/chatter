require 'rails_helper'

feature 'homepage' do
  scenario 'user can enter username and select dialect at homepage' do
    visit('/')
    expect(page).to have_field('Username')
    expect(page).to have_select('Dialect')
  end

  scenario 'user can create account and access chat area' do
    visit('/')
    fill_in('Username', with: 'new_user')
    select('Yoda', from: 'Dialect')
    click_on('Log in')
    @user = User.last
    expect(@user.username).to eq('new_user')
    expect(page).to have_css('.chat_area')
  end
end