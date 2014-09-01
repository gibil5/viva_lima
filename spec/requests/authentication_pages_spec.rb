

# jr@oblique:  1/09/14

require 'spec_helper'


describe "Authentication" do

  subject { page }



  describe "signin page" do
    before { visit signin_path }
    it { should have_content('Sign in') }
    it { should have_title('Sign in') }
  end



  describe "signin" do
    before { visit signin_path }


# with invalid information 
    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_title('Sign in') }

      # test the flash error message 
      # uses capybara have_selector 
      # checks for a div tag with the classes alert and alert-error s
      it { should have_selector('div.alert.alert-error') }

	  describe "after visiting another page" do
	    before { click_link "Inicio" }
  		  it { should_not have_selector('div.alert.alert-error') }
		end
    end






# with valid information

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      # uses capybara have_link 
      it { should have_title(user.name) }
      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }


      # Sign out 
      describe "followed by signout" do
        before { click_link "Sign out" }
        #it { should have_link('Sign in') }
        it { should have_link('Regístrate') }
      end

    end
  end
end

