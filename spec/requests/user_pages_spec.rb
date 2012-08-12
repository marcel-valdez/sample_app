include ApplicationHelper

describe "UserPages" do
  subject { page }

  describe "Sign up page" do
    before { visit signup_path }

    it { should have_selector 'h1', text: 'Sign up' }
    it { should have_selector 'title', text: full_title('Sign up') }
  end

  describe "Profile page behavior" do
    let(:user) { FactoryGirl.create(:user) }

    before { visit user_path user }

    it { should have_xpath '//img[@class="gravatar"]', count: 1 }
    it { find(:xpath, "//img/@src").text.should match("^https://secure\.gravatar\.com/avatar/.+\?s=40$")}
  end


  describe "Sign up page behavior" do

    before { visit signup_path }

    let(:create_account) { "Create my account" }
    let(:user) { User.find_by_email "user@example.com" }

    it "should create a valid account" do
      fill_in "Name", with: "Example user"
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
      fill_in "Confirmation", with: "password"
      expect { click_button create_account }.to change(User, :count).by 1
      current_url.should match user_path user
      should have_selector 'title', text: user.name
      should have_selector 'div.alert.alert-success', text: 'Welcome'
    end

    it "should not create empty account" do
      expect { click_button create_account }.not_to change(User, :count)
    end

    describe "after submission with empty data" do
      before { click_button create_account }

      it { should have_selector 'title', text: 'Sign up'}
      it { find('div.alert.alert-error').text.should match "The form contains [1-9] errors\." }

      it "should explain all errors" do
        explanations_selector = '//div[@id="error_explanation"]/ul/li'
        error_count = find('div.alert.alert-error').text.split(" ")[3].to_i
        should have_xpath explanations_selector, count: error_count
        should have_xpath explanations_selector, text: "Password can't be blank."
        should_not have_xpath explanations_selector, text: "Password digest can't be blank"
      end
    end
  end

  describe "Profile Page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1', text: user.name)}
    it { should have_selector('title', text: user.name)}
  end
end
