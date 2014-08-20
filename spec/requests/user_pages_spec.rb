

require 'spec_helper'


describe "User pages" do

  subject { page }


# Signup page specification 
  describe "signup page" do
  	
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end

end