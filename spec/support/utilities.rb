include ApplicationHelper

def valid_sign_in(user)
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    if message.nil?
      page.should have_selector('div.alert.alert-error')
    else
      page.should have_selector('div.alert.alert-error', text: message)
    end
  end
end