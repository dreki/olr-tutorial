require 'spec_helper'

describe "StaticPages" do
  describe "GET home page" do
    it "should have the content 'One Line Reviews'" do
      visit '/static_pages/home'
      page.should have_selector('h1', text: 'One Line Reviews')
    end
    
    it "should have the correct title" do
      visit '/static_pages/home'
      page.should have_selector('title',
        text: "One Line Reviews | Home")
    end
  end

  describe "GET help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', text: 'Help')
    end
    
    it "should have the correct title" do
      visit '/static_pages/help'
      page.should have_selector('title',
        text: "One Line Reviews | Help")
    end
  end

  describe "GET about page" do
    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', text: 'About Us')
    end
    
    it "should have the correct title" do
      visit '/static_pages/about'
      page.should have_selector('title',
        text: "One Line Reviews | About Us")
    end
  end
end
