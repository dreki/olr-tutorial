require 'spec_helper'

describe "StaticPages" do
  describe "GET home page" do
    it "should have the content 'One Line Reviews'" do
        visit '/static_pages/home'
        page.should have_content('One Line Reviews')
    end
  end
end
