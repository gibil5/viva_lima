
# jr@oblique: 2/09/14


require 'spec_helper'


describe "User pages" do

  subject { page }



# index 
  describe "index" do
    
    let(:user) { FactoryGirl.create(:user) }
    
    before(:each) do
      sign_in user
      visit users_path
    end

    it { should have_title('All users') }
    it { should have_content('All users') }

    describe "pagination" do

      before(:all) { 30.times { FactoryGirl.create(:user) } }
      after(:all)  { User.delete_all }

      it { should have_selector('div.pagination') }

      it "should list each user" do
        User.paginate(page: 1).each do |user|
          expect(page).to have_selector('li', text: user.name)
        end
      end
    end
  end




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



# Edit user pages 
  describe "edit" do

    let(:user) { FactoryGirl.create(:user) }
    #before { visit edit_user_path(user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end
    
    describe "page" do
      it { should have_content("Update your profile") }
      it { should have_title("Edit user") }
      it { should have_link('change', href: 'http://gravatar.com/emails') }
    end

    describe "with invalid information" do
      before { click_button "Save changes" }
      it { should have_content('error') }
    end


# with valid information 
    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Name",             with: new_name
        fill_in "Email",            with: new_email
        fill_in "Password",         with: user.password
        fill_in "Confirm Password", with: user.password
        click_button "Save changes"
      end

      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { expect(user.reload.name).to  eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end


  end


end