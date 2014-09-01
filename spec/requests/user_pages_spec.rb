

# jr@oblique: 26/08/14

require 'spec_helper'


describe "User pages" do

  subject { page }



# Signup page specification 
  describe "signup page" do
  	
    before { visit signup_path }
    #it { should have_content('Sign up') }
    #it { should have_title(full_title('Sign up')) }
    it { should have_content('Inscríbete') }
    it { should have_title(full_title('Inscríbete')) }
  end



# Test signup process, with Capybara 
  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Crea mi cuenta" }



# invalide info
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end



# valid info
    # with capybara 
    describe "with valid information" do

      before do
        fill_in "Nombre",         with: "Example User"
        fill_in "Email",          with: "user@example.com"
        fill_in "Contraseña",     with: "foobar"
        fill_in "Confirmación",   with: "foobar"
      end


      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end


      # Sign in the user after sign up 
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out') }
        it { should have_title(user.name) }
        #it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        it { should have_selector('div.alert.alert-success', text: 'Bienvenid@') }
      end

    end
  end



# Profile page 
  describe "profile page" do

    let(:user) { 
    		FactoryGirl.create(:user) 
    }

    before { 
  		# From capybara 
    	visit user_path(user) 
    }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

end