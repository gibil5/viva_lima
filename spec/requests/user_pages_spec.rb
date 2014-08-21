

# jr@oblique: 20/9/14

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

end