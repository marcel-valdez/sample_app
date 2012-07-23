require 'spec_helper'
require 'support/utilities'

def specify_one_title
  it "should have only one title" do
    page.should have_selector('title', count: 1)
  end
end

# @param [String] page_title the title of the page
def specify_title(page_title)
  it "should have the right title" do
    page.should have_selector(
                    'title',
                    text: page_title)
  end
end

def specify_only_base_title
  it "should only contain the base title" do
    page.should_not have_selector(
                    'title',
                    text: "Ruby on Rails Tutorial Sample App |")
  end
end

# @param [String] html_h1_content text content of the h1 element
# @param [String] page_url relative path to the page to visit
def specify_h1_text(html_h1_content)
  it "should have the content '#{html_h1_content}'" do
    page.should have_selector('h1', text: html_h1_content)
  end
end

# @param [String] page_url the relative URL of the page
def specify_page_url(page_url)
  it "#{page_url} should exist" do
    visit page_url
  end
end

def specify_route(page_url, path_name)
  it "#{path_name} should have route #{page_url}" do
    eval('visit ' + path_name)
    eval('assert_not_nil ' + path_name)
    eval('assert_equal page_url, ' + path_name)
  end
end

describe "StaticPages" do
  describe "Home page" do

    page_url = '/'
    page_h1_text = 'Sample App'

    begin
    specify_route(page_url, 'root_path')
    rescue
      fail "Url route not found: root_path:#{page_url}"
    end

    specify_page_url(page_url)

    before { visit page_url }

    specify_only_base_title

    specify_title full_title('')

    specify_h1_text page_h1_text

    specify_one_title
  end

  describe "Help Page" do
    page_url = '/help'
    page_title = 'Help'

    begin
      specify_route page_url, 'help_path'
    rescue
      fail "Url route not found: help_path:#{page_url}"
    end

    specify_page_url page_url

    before { visit page_url }

    specify_h1_text page_title

    specify_title full_title(page_title)

    specify_one_title
  end

  describe "About Page" do
    page_url = '/about'
    page_title = 'About Us'

    begin
    specify_route page_url, 'about_path'
    rescue
      fail "Url route not found: about_path:#{page_url}"
    end

    specify_page_url page_url

    before { visit page_url }

    specify_h1_text page_title

    specify_title full_title(page_title)

    specify_one_title
  end

  describe "Contact Page" do
    page_url = '/contact'
    page_title = 'Contact'


    begin
      specify_route page_url, 'contact_path'
    rescue
      fail "Url route not found: contact_path:#{page_url}"
    end

    specify_page_url page_url

    before { visit page_url }

    specify_h1_text page_title

    specify_title full_title(page_title)

    specify_one_title
  end
end

