# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe User do
  initial_name = "Example User"
  initial_email = "user@example.com"
  initial_password_confirmation = "password"
  initial_password = "password"

  before do
    @user = User.new(name: initial_name, email: initial_email,
                     password: initial_password, password_confirmation: initial_password_confirmation)
  end

  it "attribute initialization" do
    # Arrange
    expected_email = initial_email
    expected_name = initial_name
    expected_password = initial_password
    expected_password_confirmation = initial_password_confirmation

    # Assert
    expected_email.should match @user.email
    expected_name.should match @user.name
    expected_password.should match @user.password
    expected_password_confirmation.should match @user.password_confirmation

  end

  subject { @user }

  it { should respond_to :name }
  it { should respond_to :email }
  it { should respond_to :password_digest }
  it { should respond_to :password }
  it { should respond_to :password_confirmation }
  it { should respond_to :authenticate }

  # Tests for the validations of a User object
  it { should be_valid }

  describe "name is not present validation" do
    before { @user.name = " " }

    it { should_not be_valid }
  end

  describe "email is not present validation" do
    before { @user.email = " " }

    it { should_not be_valid }
  end

  describe "name length validation" do
    before { @user.name = "a" * 51 }

    it { should_not be_valid }
  end

  describe "upper limit of name length validation" do
    before { @user.name = "a" * 50 }

    it { should be_valid }
  end

  describe "invalid email format validation" do
    it "should be invalid" do
      # Arrange
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com foo@baz]

      # Act
      addresses.each do |invalid_address|
        @user.email = invalid_address
        # Assert
        @user.should_not be_valid
      end
    end
  end

  describe "valid email format validation" do
    it "should be valid" do
      # Arrange
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn 1foo@bar.com]

      # Act
      addresses.each do |valid_address|
        @user.email = valid_address
        # Assert
        @user.should be_valid
      end
    end
  end

  describe "email uniqueness validation" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "email format" do
    # Arrange
    before { @user.name = "Expected Name" }
    before { @user.email = "expected@email.com" }

    # Specify
    it { @user.formatted_email.should match "Expected Name <expected@email.com>" }
  end

  describe "empty password (in)validation" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "password length validation" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "authenticate method spec" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "when password is valid" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "when password is invalid" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }

      specify { user_for_invalid_password.should be_false }
    end
  end
end
