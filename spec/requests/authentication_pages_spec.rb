require 'spec_helper'

describe "Authentication behavior: " do

  subject { page }

  describe 'Sign in page' do
    before { visit signin_path }

    it { should have_selector 'h1', text: 'Sign in' }
    it { should have_selector 'title', text: 'Sign in' }

    it { should have_button 'Sign in' }

    it { should have_selector 'label', text: "Email" }
    it { should have_selector 'input#session_email' }

    it { should have_selector 'label', text: "Password" }
    it { should have_selector 'input#session_password' }

    describe 'with empty credentials' do
      before { click_button 'Sign in' }

      it { should have_error_message 'Invalid' }

      describe 'after visiting another page' do
        before { click_link 'Home' }

        it { should_not have_error_message }
      end
    end

    describe 'with valid credentials' do
      let(:user) { FactoryGirl.create(:user) }
      before { valid_sign_in user }

      it { should have_selector 'title', text: user.name }
      it { should have_link 'Profile', href: user_path(user) }
      it { should have_link 'Sign out', href: signout_path }
      it { should_not have_link 'Sign in', href: signin_path }
      it { should have_selector 'img.gravatar' }

      describe 'upon signout' do
        before { click_link 'Sign out' }

        it { should have_link 'Sign in', href: signin_path }
        it { should_not have_link 'Sign out' }
        it { should_not have_link 'Profile' }
        it { should_not have_selector 'title', text: user.name }
      end
    end
  end
end