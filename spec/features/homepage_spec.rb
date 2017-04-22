require 'rails_helper'

feature 'homepage' do
  scenario 'user can enter username and select dialect at homepage' do
    visit('/')
    fill_in('Username', with: 'new_user')
    select('Yoda', from: 'Dialect')
  end
end