include ApplicationHelper

describe "UserPages" do
  subject { page }

  describe "Sign up page" do
    before { visit signup_path }

    it { should have_selector 'h1', text: 'Sign up' }
    it { should have_selector 'title', text: full_title('Sign up') }
  end


  describe "Sign up page behavior" do

    before { visit signup_path }

    let(:create_account) { "Create my account" }


    it "should create a valid account" do
      fill_in "Name", with: "Example user"
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
      fill_in "Confirmation", with: "password"
      expect { click_button create_account }.to change(User, :count).by 1
    end

    it "should not create empty account" do
      expect { click_button create_account }.not_to change(User, :count)
    end
  end

  describe "Profile Page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1', text: user.name)}
    it { should have_selector('title', text: user.name)}
  end
end
