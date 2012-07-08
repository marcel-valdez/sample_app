require "rspec"

describe "Specifies behavior of application_helper" do

  it "should create the empty base title" do
    # Arrange
    expected_title = "Ruby on Rails Tutorial Sample App"
    target = Object.new
    target.extend ApplicationHelper

    # Act
    base_title = target.full_title("")

    # Assert
    base_title.should match(expected_title)
  end

  it "should create the base title with specific title" do
    # Arrange
    expected_title = "Ruby on Rails Tutorial Sample App | specific"
    target = Object.new
    target.extend ApplicationHelper

    # Act
    actual_title = target.full_title("specific")

    # Assert
    actual_title.should match(expected_title)
  end
end