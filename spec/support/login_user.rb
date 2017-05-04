class LoginUser
  include Capybara::DSL
  def initialize(params = {})
    visit('/')
    fill_in('Username', with: params.fetch(:username, 'new_test_user' ))
    select('Yoda', from: 'Dialect')
    click_on('Log in')
  end
end