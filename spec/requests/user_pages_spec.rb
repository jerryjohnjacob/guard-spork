require 'spec_helper'

describe "UserPages" do
  subject { page }
  describe "New User Page" do
    before { visit signup_path }
    it { should have_title('RoR New User') }
    it { should have_content('Welcome to Hell, New User!') }
    it { should_not have_title('| New User') }
  end
end
