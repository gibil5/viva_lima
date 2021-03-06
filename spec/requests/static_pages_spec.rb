
#jr@oblique: 24/9/14


require 'spec_helper'


# Example group 
describe "Static pages" do



subject { page }



# Home page specifications  
  describe "Home page" do
    before { visit root_path }
    #it { should have_content('Sample App') }
    it { should have_content('Viva Lima') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }


    # For signed-in users 
    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
    end

  end


# Help page specifications 
  describe "Help page" do

    before { visit help_path }

    it { should have_content('Help') }
    it { should have_title(full_title('Help')) }
    #it { should have_content('Ayuda') }
    #it { should have_title(full_title('Ayuda')) }
  end


# About page specifications 
  describe "About page" do

    before { visit about_path }

    it { should have_content('About') }
    it { should have_title(full_title('About Us'))}
    #it { should have_content('Quiénes somos') }
    #it { should have_title(full_title('Quiénes somos'))}

  end


# Contact page specification 
  describe "Contact page" do

    before { visit contact_path }

    it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }
    #it { should have_content('Contáctanos') }
    #it { should have_title(full_title('Contáctanos')) }

  end

end




