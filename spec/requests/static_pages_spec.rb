require 'spec_helper'
include ApplicationHelper

describe "StaticPages" do

  subject { page }

  shared_examples_for "all static pages" do
    #specify_page_url
    it "should exist" do
      visit page_url
    end

    #specify_route
    it "should have a named route" do
      eval('visit ' + path_name)
      eval('assert_not_nil ' + path_name)
      eval('assert_equal page_url, ' + path_name)
    end

    #specify_one_title
    it "should have only one title" do
      should have_selector('title', count: 1)
    end

    #specify_title
    it "should have the right title" do
      should have_selector(
                      'title',
                      text: page_title)
    end

    #specify_h1_text
    it "should have the correct content" do
      should have_selector('h1', text: page_h1_text)
    end
  end

  describe "Home page" do

    let(:page_url) { '/' }
    let(:page_h1_text) { 'Sample App' }
    let(:page_title) { full_title('') }
    let(:path_name) { 'root_path' }

    before { visit page_url }

    it_should_behave_like "all static pages"

    #specify_only_base_title
    it "should only contain the base title" do
      should_not have_selector(
                          'title',
                          text: "Ruby on Rails Tutorial Sample App |")
    end
  end

  describe "Help Page" do
    let(:page_url) { '/help' }
    let(:page_h1_text) { 'Help' }
    let(:page_title) { full_title('Help') }
    let(:path_name) { 'help_path' }

    before { visit page_url }

    it_should_behave_like "all static pages"
  end

  describe "About Page" do
    let(:page_url) { '/about' }
    let(:page_h1_text) { 'About Us' }
    let(:page_title) { full_title('About Us') }
    let(:path_name) { 'about_path' }

    before { visit page_url }

    it_should_behave_like "all static pages"

  end

  describe "Contact Page" do
    let(:page_url) { '/contact' }
    let(:page_h1_text) { 'Contact' }
    let(:page_title) { full_title('Contact') }
    let(:path_name) { 'contact_path' }

    before { visit page_url }

    it_should_behave_like "all static pages"
  end

  it "should have the right links layout" do
    visit root_path

    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')

    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')

    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')

    click_link "sample app"
    page.should have_selector 'title', text: full_title('')

    click_link "Home"
    click_link "Sign up now"
    page.should have_selector 'title', text: full_title("Sign up")
  end
end

