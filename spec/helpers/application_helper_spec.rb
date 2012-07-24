require "rspec"

describe ApplicationHelper do

  it "Should create the empty base-title" do

    # Arrange
    expected_title = "Ruby on Rails Tutorial Sample App"

    # Act
    base_title = full_title("")

    # Assert
    base_title.should match(expected_title) and not include ("|")
  end

  it "Should create the base title using a specific title" do
    # Arrange
    expected_title = "Ruby on Rails Tutorial Sample App | specific"

    # Act
    actual_title = full_title("specific")

    # Assert
    actual_title.should match(expected_title)
  end
end