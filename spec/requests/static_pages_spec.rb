require 'spec_helper'

# @param [String] page_url relative path to the page to visit
def specify_one_title(page_url)
  it "should have only one title" do
    visit page_url
    page.should have_selector('title', count: 1)
  end
end

# @param [String] page_url relative path to the page to visit
# @param [String] page_title the title of the page
def specify_title(page_url, page_title)
  it "should have the right title" do
    visit page_url
    page.should have_selector(
                    'title',
                    text: "Ruby on Rails Tutorial Sample App | #{page_title}")
  end
end

# @param [String] html_h1_content text content of the h1 element
# @param [String] page_url relative path to the page to visit
def specify_h1_text(page_url, html_h1_content)
  it "should have the content '#{html_h1_content}'" do
    visit page_url
    page.should have_selector('h1', text: html_h1_content)
  end
end

describe "StaticPages" do
  describe "Home page" do
    page_url = '/static_pages/home'
    page_title = "Home"
    page_h1_text = "Sample App"

    specify_h1_text(page_url, page_h1_text)

    specify_title(page_url, page_title)

    specify_one_title page_url
  end

  describe "Help Page" do
    page_url = '/static_pages/help'
    page_title = 'Help'

    specify_h1_text(page_url, page_title)

    specify_title(page_url, page_title)

    specify_one_title(page_url)
  end

  describe "About Page" do
    page_url = '/static_pages/about'
    page_title = 'About Us'

    specify_h1_text(page_url, page_title)

    specify_title(page_url, page_title)

    specify_one_title(page_url)
  end

end

