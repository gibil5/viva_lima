

#jr@oblique: 19/9/14

require 'spec_helper'


# Example group 
describe "Static pages" do



# Home page specifications  
  describe "Home page" do

# Code example 
    it "should have the content 'Sample App'" do

      visit '/static_pages/home'
      expect(page).to have_content('Sample App')

    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Home")
    end
 
  end



# Help page specifications 
  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Help")
    end

  end


# About page specifications 
describe "About page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end
    
    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | About Us")
    end

  end




end




