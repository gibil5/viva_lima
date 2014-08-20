

#jr@oblique: 19/9/14

require 'spec_helper'


# Example group 
describe "Static pages" do



subject { page }


# Home page specifications  
  describe "Home page" do

    before { visit root_path }
  
    it { should have_content('Sample App') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }

  end




# Help page specifications 
  describe "Help page" do

    before { visit help_path }

    it { should have_content('Help') }
    it { should have_title(full_title('Help')) }
  end


# About page specifications 
  describe "About page" do

    before { visit about_path }

    it { should have_content('About') }
    it { should have_title(full_title('About Us'))}
  end



# Contact page specification 
  describe "Contact page" do

    before { visit contact_path }

    it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }

  end

end




