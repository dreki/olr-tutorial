require 'spec_helper'

describe "StaticPages" do
  describe "GET home page" do
    it "should have the content 'One Line Reviews'" do
      visit '/static_pages/home'
      page.should have_content('One Line Reviews')
    end
  end

  describe "GET help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_content('Help')
    end
  end

  describe "GET about page" do
    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_content('About Us')
    end
  end
end
